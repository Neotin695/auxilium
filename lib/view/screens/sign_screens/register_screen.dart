import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/add_user.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool aTrackPassword = true;
  bool pTrackPassword = true;

  GlobalKey<FormState> key = GlobalKey<FormState>();

  final fireStore = FirebaseFirestore.instance;
  TextEditingController aEmailController = TextEditingController();
  TextEditingController pEmailController = TextEditingController();
  TextEditingController aPasswordController = TextEditingController();
  TextEditingController pPasswordController = TextEditingController();
  TextEditingController aNameController = TextEditingController();
  TextEditingController pNameController = TextEditingController();

  @override
  void dispose() {
    aEmailController.dispose();
    pEmailController.dispose();
    aPasswordController.dispose();
    pPasswordController.dispose();
    aNameController.dispose();
    pNameController.dispose();
    super.dispose();
  }

  addUser() {
    fireStore
        .collection('users')
        .doc('${pEmailController.text.trim()}+${aEmailController.text.trim()}')
        .set(
      {
        'adminEmail': aEmailController.text,
        'adminName': aNameController.text,
        'adminPassword': aPasswordController.text,
        'patientEmail': pEmailController.text,
        'patientName': pNameController.text,
        'patientPassword': pPasswordController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.teal,
                        Colors.indigoAccent,
                        Colors.indigo,
                      ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  )),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 6.0),
                  child: Lottie.asset(
                    "asset/lottie/indgiochair.json",
                    width: 150,
                    height: 150,
                    repeat: true,
                    // reverse: true,
                  ),
                ),
              ),
            ),
            Form(
              key: key,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: aNameController,
                        decoration: const InputDecoration(
                          hoverColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.indigo,
                          ),
                          labelText: "Caregiver's Fullname",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'field is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: pNameController,
                        decoration: const InputDecoration(
                          hoverColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.indigo,
                          ),
                          labelText: "Patient's Fullname",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'field is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: aEmailController,
                        decoration: const InputDecoration(
                          hoverColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.indigo,
                          ),
                          labelText: "Caregiver's Email",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),

                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: pEmailController,
                        decoration: const InputDecoration(
                          hoverColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.indigo,
                          ),
                          labelText: "Patient's Email",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'field is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: aPasswordController,
                        obscureText: aTrackPassword,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (aTrackPassword) {
                                  aTrackPassword = false;
                                } else {
                                  aTrackPassword = true;
                                }
                              });
                            },
                            icon: Icon(aTrackPassword == true
                                ? Icons.remove_red_eye
                                : Icons.password),
                          ),
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Colors.indigo,
                          ),

                          labelText: "Caregiver's Password",
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),

                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: pPasswordController,
                        obscureText: pTrackPassword,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (pTrackPassword) {
                                  pTrackPassword = false;
                                } else {
                                  pTrackPassword = true;
                                }
                              });
                            },
                            icon: Icon(pTrackPassword == true
                                ? Icons.remove_red_eye
                                : Icons.password),
                          ),
                          hoverColor: Colors.grey,
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Colors.indigo,
                          ),
                          labelText: "Patient's Password",
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.indigo,
                      ),
                      child: TextButton(
                        onPressed: () {
                          addUser();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen()),
                              (route) => true);
                         },
                        style: TextButton.styleFrom(
                          minimumSize: const Size(double.infinity, 20),
                        ),
                        child: const Text(
                          "REGISTER",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            style: TextButton.styleFrom(
              primary: Colors.indigo,
            ),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
