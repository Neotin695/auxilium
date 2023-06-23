import 'package:auxilium2/controller/notification_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';
import '../../../../config/preferences_helper.dart';
import '../../../../config/style.dart';
import '../../../../model/medicine_model.dart';

enum Repeat {
  daily,
  monthly,
  weekly,
  custom,
}

class ManageMedicine extends StatefulWidget {
  const ManageMedicine({Key? key}) : super(key: key);
  @override
  State<ManageMedicine> createState() => _ManageMedicineState();
}

class _ManageMedicineState extends State<ManageMedicine> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();
  List<MedicineModel> medicineModel = [];
  bool flag = false;
  Future<void> getData() async {
    medicineModel = [];
    flag = false;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(PreferencesHelper.instance.getUser()!.chatID!)
        .collection('medicine')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print(element['Medicine Name']);
        medicineModel.add(MedicineModel.fromJson(element.data()));
        setState(() {
          flag = true;
        });
        print(medicineModel[0].medicineName);
      });
    }).catchError((onError) {});
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  Repeat repeat = Repeat.daily;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !flag
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
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
                          height: 35,
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
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 30,
                                )),
                            const SizedBox(
                              width: 55,
                            ),
                            const Text(
                              "Medicines",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: ListView.builder(
                      itemCount: medicineModel.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.indigoAccent,
                                    width: 2),
                                borderRadius: BorderRadius.circular(40)),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        Colors.teal,
                                        Colors.indigoAccent,
                                        Colors.indigo,
                                      ]),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: const Icon(
                                    Icons.medication_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "Name : ",
                                            style: TextStyle(
                                                color: Colors.indigo,
                                                fontSize: 20),
                                          ),
                                          Text(
                                              " ${medicineModel[index].medicineName!}",
                                              style: const TextStyle(
                                                color: Colors.indigoAccent,
                                                fontSize: 16,
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Frequency : ",
                                            style: TextStyle(
                                                color: Colors.indigo,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                              " ${medicineModel[index].frequency!}",
                                              style: const TextStyle(
                                                color: Colors.indigoAccent,
                                                fontSize: 16,
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Dosage : ",
                                            style: TextStyle(
                                                color: Colors.indigo,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                              " ${medicineModel[index].dosage!}",
                                              style: const TextStyle(
                                                color: Colors.indigoAccent,
                                                fontSize: 16,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
            // Navigator.push(context, MaterialPageRoute(builder: (_)=>const TestScreen()),
            async {
          final bool result = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60,
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
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New medicine",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            color: Colors.white70,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                              ),
                            ]),
                        child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                              hoverColor: Colors.grey,
                              prefixIcon: Icon(
                                Icons.medication,
                                color: Colors.indigo,
                              ),
                              labelText: "Medicine's Name",
                              labelStyle: TextStyle(color: Colors.indigo),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                                borderSide: BorderSide(color: Colors.indigo),
                              )),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            color: Colors.white70,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                              ),
                            ]),
                        child: TextFormField(
                          controller: dosageController,
                          decoration: const InputDecoration(
                              hoverColor: Colors.grey,
                              prefixIcon: Icon(
                                Icons.medical_information,
                                color: Colors.indigo,
                              ),
                              labelText: "Enter the Dosage",
                              labelStyle: TextStyle(color: Colors.indigo),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                                borderSide: BorderSide(color: Colors.indigo),
                              )),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            color: Colors.white70,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                              ),
                            ]),
                        child: TextFormField(
                          controller: frequencyController,
                          decoration: const InputDecoration(
                              hoverColor: Colors.grey,
                              prefixIcon: Icon(
                                Icons.format_list_numbered_sharp,
                                color: Colors.indigo,
                              ),
                              labelText: "Enter the Frequency",
                              labelStyle: TextStyle(color: Colors.indigo),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                                borderSide: BorderSide(color: Colors.indigo),
                              )),
                        ),
                      ),
                      const SizedBox(height: 15),
                      DropdownButton(
                        hint: Text(repeat.name),
                        items: ['Daily', 'Weekly', 'Monthly']
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          repeat = convertEnumToString(value.toString());
                          setState(() {});
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await showTimePicker(
                                  context: context, initialTime: selectedTime)
                              .then(
                            (value) {
                              if (value != null) {
                                selectedTime = value;
                                setState(() {});
                              }
                            },
                          );
                        },
                        child: const Text('Select Date'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: IconButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(PreferencesHelper.instance
                                          .getUser()!
                                          .chatID)
                                      .collection('medicine')
                                      .add({
                                    "Medicine Name": nameController.text,
                                    "dosage": dosageController.text,
                                    "frequency": frequencyController.text,
                                  }).then((value) {
                                    getData();

                                    Navigator.pop(context, true);
                                  });
                                },
                                icon: const Icon(
                                  Icons.done_outline_rounded,
                                  color: Colors.green,
                                  size: 30,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                icon: const Icon(Icons.cancel_outlined,
                                    color: Colors.red, size: 30)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
          if (result == true) {
            await NotificationSerivce.instance().showNotification(
                1,
                nameController.text.trim(),
                'Frequency: ${frequencyController.text}\nDosage: ${dosageController.text}',
                DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    selectedTime.hour,
                    selectedTime.minute,
                    DateTime.now().second),
                Repeat.daily);
          }
        },
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Repeat convertEnumToString(String value) {
    switch (value) {
      case 'Daily':
        return Repeat.daily;
      case 'Weekly':
        return Repeat.weekly;
      case 'Monthly':
        return Repeat.monthly;
      default:
        return Repeat.daily;
    }
  }
}
