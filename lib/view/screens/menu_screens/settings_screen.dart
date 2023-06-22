import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';

import '../../../config/preferences_helper.dart';
import '../../../config/style.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController adminName = TextEditingController();
  TextEditingController patientName = TextEditingController();
  TextEditingController adminPassword = TextEditingController();
  TextEditingController patientPassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    adminName.text = PreferencesHelper.instance.getUserAdmin()!.name!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      width: 60,
                    ),
                    const Text(
                      "Settings",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.indigo,
              size: 25,
            ),
            title: const Text(
              "Caregiver's name",
              style: TextStyle(color: Colors.indigo, fontSize: 20),
            ),
            subtitle: Text(adminName.text),
            onTap: () {
              //Edit the name in the firestore
            },
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                controller: adminName,
                                decoration: const InputDecoration(
                                    hoverColor: Colors.grey,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.indigo,
                                    ),
                                    labelText: "Caregiver's Name",
                                    labelStyle: TextStyle(color: Colors.indigo),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200)),
                                      borderSide:
                                          BorderSide(color: Colors.indigo),
                                    )),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(PreferencesHelper.instance
                                          .getUser()!
                                          .chatID!)
                                      .update({
                                    'adminName': adminName.text
                                  }).then((value) {
                                    setState(() {});
                                    Navigator.maybePop(context);
                                  });
                                },
                                child: Text("Edit")),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.indigo,
                )),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.indigo,
              size: 25,
            ),
            title: const Text(
              "Patient's name",
              style: TextStyle(color: Colors.indigo, fontSize: 20),
            ),
            subtitle: Text(patientName.text),
            onTap: () {
              //Edit the name in the firestore
            },
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                obscuringCharacter: '*',
                                controller: patientName,
                                decoration: const InputDecoration(
                                    hoverColor: Colors.grey,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.indigo,
                                    ),
                                    labelText: "Patient's Name",
                                    labelStyle: TextStyle(color: Colors.indigo),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200)),
                                      borderSide:
                                          BorderSide(color: Colors.indigo),
                                    )),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(PreferencesHelper.instance
                                          .getUser()!
                                          .chatID!)
                                      .update({
                                    'patientName': patientName.text
                                  }).then((value) {
                                    setState(() {});
                                    Navigator.maybePop(context);
                                  });
                                },
                                child: const Text("Edit")),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.indigo,
                )),
          ),
          ListTile(
            leading: const Icon(
              Icons.key,
              color: Colors.indigo,
              size: 25,
            ),
            title: const Text(
              "Caregiver's password",
              style: TextStyle(color: Colors.indigo, fontSize: 20),
            ),
            onTap: () {
              //Edit the name in the firestore
            },
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                controller: adminPassword,
                                decoration: const InputDecoration(
                                    hoverColor: Colors.grey,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.indigo,
                                    ),
                                    labelText: "Caregiver's password",
                                    labelStyle: TextStyle(color: Colors.indigo),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200)),
                                      borderSide:
                                          BorderSide(color: Colors.indigo),
                                    )),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(PreferencesHelper.instance
                                          .getUser()!
                                          .chatID!)
                                      .update({
                                    'adminPassword': adminPassword.text
                                  }).then((value) {
                                    setState(() {});
                                    Navigator.maybePop(context);
                                  });
                                },
                                child: Text("Edit")),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.indigo,
                )),
          ),
          ListTile(
            leading: const Icon(
              Icons.key,
              color: Colors.indigo,
              size: 25,
            ),
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                obscuringCharacter: '*',
                                controller: patientPassword,
                                decoration: const InputDecoration(
                                    hoverColor: Colors.grey,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.indigo,
                                    ),
                                    labelText: "Patient's Password",
                                    labelStyle: TextStyle(color: Colors.indigo),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200)),
                                      borderSide:
                                          BorderSide(color: Colors.indigo),
                                    )),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(PreferencesHelper.instance
                                          .getUser()!
                                          .chatID!)
                                      .update({
                                    'patientPassword': patientPassword.text
                                  }).then((value) {
                                    setState(() {});
                                    Navigator.maybePop(context);
                                  });
                                },
                                child: Text("Edit")),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.indigo,
                )),
            title: const Text(
              "Patient's Password",
              style: TextStyle(color: Colors.indigo, fontSize: 20),
            ),
            onTap: () {
              //
              //Edit the name in the firestore
            },
          ),
        ],
      ),
    );
  }
}
