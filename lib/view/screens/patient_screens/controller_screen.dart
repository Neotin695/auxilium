import 'dart:convert';

import 'package:auxilium2/config/style.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:holding_gesture/holding_gesture.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});

  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}
class _ControllerScreenState extends State<ControllerScreen> {
  bool isTapped = false;

  void portraitModeOnly() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  // Initializing the Bluetooth connection state to be unknown
  BluetoothState bluetoothState = BluetoothState.UNKNOWN;

  // Get the instance of the Bluetooth
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  // Track the Bluetooth connection with the remote device
  BluetoothConnection? connection;

  // To track whether the device is still connected to Bluetooth
  bool get isConnected => connection != null && connection!.isConnected;
  List<BluetoothDevice> _devicesList = [];
  bool isDisconnecting = false;
  bool connected = false;
  BluetoothDevice? device;

  @override
  void initState() {
    super.initState();
    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        bluetoothState = state;
      });
    });

    // If the Bluetooth of the device is not enabled,
    // then request permission to turn on Bluetooth
    // as the app starts up
    // enableBluetooth();
    // Listen for further state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        bluetoothState = state;

        // For retrieving the paired devices list
        getPairedDevices();
      });
    });
  }

  Future<bool> enableBluetooth() async {
    // Retrieving the current Bluetooth state
    bluetoothState = await FlutterBluetoothSerial.instance.state;

    // If the Bluetooth is off, then turn it on first
    // and then retrieve the devices that are paired.
    if (bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      return true;
    } else {
      await getPairedDevices();
    }
    return false;
  }

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    // To get the list of paired devices
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }

    // It is an error to call [setState] unless [mounted] is true.
    if (!mounted) {
      return;
    }

    // Store the [devices] list in the [_devicesList] for accessing
    // the list outside this class
    setState(() {
      _devicesList = devices;
    });
  }

  List<DropdownMenuItem<BluetoothDevice>> getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(const DropdownMenuItem(
        child: Text(
          'NONE',
          style: TextStyle(color: Colors.black),
        ),
      ));
    } else {
      _devicesList.forEach((device) {
        items.add(DropdownMenuItem(
          value: device,
          child: Text(
            //  device.name == null ?"please connect device" : device.name!,
            device.name ?? "HC-05",
            style: const TextStyle(color: Colors.black),
          ),
        ));
      });
    }
    return items;
  }

  void connect() async {
    if (device == null) {
      print('No device selected');
    } else {
      if (!isConnected) {
        // Trying to connect to the device using
        // its address
        await BluetoothConnection.toAddress(device!.address)
            .then((_connection) {
          print('Connected to the device');
          connection = _connection;

          // Updating the device connectivity
          // status to [true]
          setState(() {
            connected = true;
          });

          // This is for tracking when the disconnecting process
          // is in progress which uses the [isDisconnecting] variable
          // defined before.
          // Whenever we make a disconnection call, this [onDone]
          // method is fired.
          connection!.input?.listen(null).onDone(() {
            if (isDisconnecting) {
              print('Disconnecting locally!');
            } else {
              print('Disconnected remotely!');
            }
            if (this.mounted) {
              setState(() {});
            }
          });
        }).catchError((error) {
          print('Cannot connect, exception occurred');
          print(error);
        });
        print('Device connected');
      }
    }
  }

  void disconnect() async {
    // Closing the Bluetooth connection
    await connection?.close();
    print('Device disconnected');

    // Update the [_connected] variable
    if (!connection!.isConnected) {
      setState(() {
        connected = false;
      });
    }
  }

  bool isPressed = false;

  void sendMessageToBluetooth(String val) async {
    connection?.output.add(Uint8List.fromList(utf8.encode(val)));
    showToast(val,
        context: context,
        animation: StyledToastAnimation.slideFromBottom,
        position: StyledToastPosition.bottom,
        textStyle: const TextStyle( color: Colors.white));
    await connection?.output.allSent;
  }

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    portraitModeOnly();
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: double.infinity,
                    height: 112,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.teal,
                          Colors.indigoAccent,
                          Colors.indigo,
                        ],
                      ),
                      borderRadius: AppStyle.roundCorners,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 35,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon:const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 30,
                                )),
                            const SizedBox(
                              width: 70,
                            ),
                            const Text(
                              "Home",
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "Let's control the chair!",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 10),
                child: SizedBox(
                  width: 400,
                  height: 450,
                  child: Column(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.green.withOpacity(0.3),
                                offset: const Offset(0, 25),
                                blurRadius: 8,
                                spreadRadius: 0)
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        child: HoldDetector(
                          onHold: forwardButton,
                          onCancel: stopFunction,
                          holdTimeout: const Duration(milliseconds: 200),
                          enableHapticFeedback: true,
                          child: const Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.green,
                            size: 110,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 39,
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.pink.withOpacity(0.3),
                                    offset: const Offset(0, 25),
                                    blurRadius: 8,
                                    spreadRadius: 0)
                              ],
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            child: HoldDetector(
                              onHold: leftButton,
                              onCancel: stopFunction,

                              holdTimeout: const Duration(milliseconds: 200),
                              enableHapticFeedback: true,
                              child: const Icon(
                                Icons.keyboard_arrow_left,
                                color: Colors.pink,
                                size: 110,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.red.withOpacity(0.3),
                                    offset: const Offset(0, 25),
                                    blurRadius: 8,
                                    spreadRadius: 0)
                              ],
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            child:  HoldDetector(
                              onHold: rightButton,
                              onCancel: stopFunction,
                              holdTimeout: const Duration(milliseconds: 200),
                              enableHapticFeedback: true,
                              child: const Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.red,
                                size: 110,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                offset: const Offset(0, 25),
                                blurRadius: 8,
                                spreadRadius: 0)
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        child:HoldDetector(
                          onHold: backwardButton,
                          onCancel: stopFunction,
                          holdTimeout: const Duration(milliseconds: 200),
                          enableHapticFeedback: true,
                          child:  const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.blue,
                            size: 110,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: bluetoothState.isEnabled,
                    activeColor: Colors.indigo,
                    onChanged: (bool value) {
                      future() async {
                        if (value) {
                          await FlutterBluetoothSerial.instance.requestEnable();
                        } else {
                          await FlutterBluetoothSerial.instance.requestDisable();
                        }
                        await getPairedDevices();
                        if (connected) {
                          disconnect();
                        }
                      }

                      future().then((_) {
                        setState(() {});
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  DropdownButton(
                    iconEnabledColor: Colors.indigo,
                    focusColor: Colors.white,
                    items: getDeviceItems(),
                    onChanged: (value) {
                      setState(() {
                        device = value as BluetoothDevice?;
                      });
                    },
                    value: _devicesList.isNotEmpty ? device : null,
                    dropdownColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                height: 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal,
                      Colors.indigoAccent,
                      Colors.indigo,
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
                child: TextButton(
                  onPressed: connected ? disconnect : connect,
                  child: Text(
                    connected ? 'Disconnect' : 'Connect',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  forwardButton() {
    isTapped =true;
    sendMessageToBluetooth('F');
  }
  backwardButton() {
    isTapped =true;
    sendMessageToBluetooth('B');
  }
  leftButton() {
    isTapped =true;
    sendMessageToBluetooth('L');
  }
  rightButton() {
    isTapped =true;
    sendMessageToBluetooth('R');
  }
  stopFunction(){
    isTapped= false;
    sendMessageToBluetooth('S');
  }
}
