import 'package:auxilium2/config/preferences_helper.dart';
import 'package:auxilium2/model/user_model.dart';
import 'package:auxilium2/view/screens/home_screen.dart';
import 'package:auxilium2/view/screens/sign_screens/register_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool trackPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final fireStore = FirebaseFirestore.instance; //Singleton design pattern

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.teal,
                        Colors.indigoAccent,
                        Colors.indigo,
                      ]),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100))),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 25),
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
            Padding(
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
                      controller: emailController,
                      decoration: const InputDecoration(
                        hoverColor: Colors.grey,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.indigo,
                        ),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
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
                      obscureText: trackPassword,
                      //if the bool =true it will show ** vice verse
                      obscuringCharacter: '*',

                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (trackPassword) {
                                trackPassword = false;
                              } else {
                                trackPassword = true;
                              }
                            });
                          },
                          icon: Icon(trackPassword == true
                              ? Icons.remove_red_eye
                              : Icons.password),
                        ),
                        hoverColor: Colors.grey,
                        prefixIcon: const Icon(
                          Icons.key,
                          color: Colors.indigo,
                        ),
                        labelText: 'Password',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //END OF TEXT FIELDS*
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.indigo,
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize:
                        const Size(double.infinity, 20),
                      ),
                      onPressed: () async {
                        EasyLoading.show(status: 'Loading...');
                        CollectionReference col1 =
                            FirebaseFirestore.instance.collection('users');
                        final snapshots = col1.snapshots().map(
                              (snapshot) => snapshot.docs.where(
                                (doc) =>
                                    (doc["adminEmail"] ==
                                            emailController.text.trim() &&
                                        doc["adminPassword"] ==
                                            passwordController.text.trim()) ||
                                    (doc["patientEmail"] ==
                                            emailController.text.trim() &&
                                        doc["patientPassword"] ==
                                            passwordController.text.trim()),
                              ),
                            );
                        List<QueryDocumentSnapshot> data =
                            (await snapshots.first).toList();

                        EasyLoading.dismiss();

                        if (data.isNotEmpty) {
                          String email =
                              emailController.text.trim().split('@').last;
                          if (email == 'admin.com') {
                            PreferencesHelper.instance.setUser(
                              UserModel(
                                idDoc:  '${data.first.get('patientEmail')}+${data.first.get('adminEmail')}',
                                email: emailController.text.trim(),
                                type: 1,
                                name: data.first.get('adminName') ?? '',
                                chatID:
                                    '${data.first.get('patientEmail')}+${data.first.get('adminEmail')}',
                              ),
                            );
                            PreferencesHelper.instance.setAdminUser(
                              UserModel(
                                idDoc:'${data.first.get('patientEmail')}+${data.first.get('adminEmail')}',
                                email: emailController.text.trim(),
                                type: 0,
                                name: data.first.get('patientName') ?? '',
                                chatID:
                                '${data.first.get('patientEmail')}+${data.first.get('adminEmail')}',
                              ),
                            );
                          } else {
                            PreferencesHelper.instance.setUser(
                              UserModel(
                                idDoc:'${data.first.get('patientEmail')}+${data.first.get('adminEmail')}',
                                email: emailController.text.trim(),
                                type: 0,
                                name: data.first.get('patientName') ?? '',
                                chatID:
                                    '${data.first.get('patientEmail')}+${data.first.get('adminEmail')}',
                              ),
                            );
                            PreferencesHelper.instance.setAdminUser(
                              UserModel(
                                idDoc:  '${data.first.get('patientEmail')}+${data.first.get('adminEmail')}',
                                email: emailController.text.trim(),
                                type: 1,
                                name: data.first.get('adminName') ?? '',
                                chatID:
                                '${data.first.get('patientEmail')}+${data.first.get('adminEmail')}',
                              ),
                            );
                            print(PreferencesHelper.instance.getUser()!.chatID);
                          }
                          Future.delayed(
                            Duration.zero,
                            () => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                              (route) => false,
                            ),
                          );
                        } else {
                          EasyLoading.showError(
                            'Email or password is not correct',
                          );
                        }
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an account?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );
            },
            style: TextButton.styleFrom(
              primary: Colors.indigoAccent,
            ),
            child:const Text('Register'),
          ),
        ],
      ),
    );
  }
}
