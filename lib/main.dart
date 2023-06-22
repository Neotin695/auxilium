import 'package:auxilium2/controller/di.dart';
import 'package:auxilium2/view/screens/sign_screens/register_screen.dart';
import 'package:auxilium2/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'controller/notification.dart';

main() async {
  DI.instance.init();
  // AwesomeNotifications().initialize(
  //   // set the icon to null if you want to use the default app icon
  //     'resource://drawable/ic_launcher',
  //     [
  //       NotificationChannel(
  //           channelGroupKey: 'basic_channel_group',
  //           channelKey: 'basic_channel',
  //           channelName: 'Basic notifications',
  //           channelDescription: 'Notification channel for basic tests',
  //           defaultColor: Color(0xFF9D50DD),
  //           ledColor: Colors.white)
  //     ],
  //     // Channel groups are only visual and are not required
  //
  //     debug: true
  // );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    // AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    //   if (!isAllowed) {
    //     // This is just a basic example. For real apps, you must show some
    //     // friendly dialog box before call the request method.
    //     // This is very important to not harm the user experience
    //     AwesomeNotifications().requestPermissionToSendNotifications();
    //   }
    // });
    // // Only after at least the action method is set, the notification events are delivered


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // AwesomeNotifications().actionStream.listen(
    //         (ReceivedNotification receivedNotification){
    //
    //       print(receivedNotification);
    //
    //     }
    // );
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      builder: EasyLoading.init(),
    );
  }
}
