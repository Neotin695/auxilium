import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';

import '../../../../config/style.dart';


class NewMedicine extends StatefulWidget {
  const NewMedicine({Key? key}) : super(key: key);

  @override
  State<NewMedicine> createState() => _NewMedicineState();
}

class _NewMedicineState extends State<NewMedicine> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  final fireStore = FirebaseFirestore.instance;
  TextEditingController medicineController = TextEditingController();

  @override
  void dispose() {
    medicineController.dispose();
    super.dispose();
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
                      width: 40,
                    ),
                    const Text(
                      "New Medicine",
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
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Form(
              key: key,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: Colors.white70,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: medicineController,
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
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
