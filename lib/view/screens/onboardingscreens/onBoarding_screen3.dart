import 'package:flutter/Material.dart';
import 'package:lottie/lottie.dart';

import '../../../config/preferences_helper.dart';
import '../sign_screens/login_screen.dart';
import '../sign_screens/register_screen.dart';
import 'onBoarding_screen2.dart';

class OnBoardingScreen3 extends StatefulWidget {
  const OnBoardingScreen3({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen3> createState() => _OnBoardingScreen3State();
}

class _OnBoardingScreen3State extends State<OnBoardingScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.teal,
              Colors.indigoAccent,
              Colors.indigo,
            ]),
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Column(children: [
                Center(
                  child: Container(
                    width: 380,
                    height: 489,
                    decoration: const BoxDecoration(color: Colors.white70),
                    child: Column(
                      children: [
                        Lottie.asset(
                          "asset/lottie/host.json",
                          width: 250,
                          height: 250,
                          repeat: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Why Auxilium?",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "To improve the balance and posture",
                          style: TextStyle(fontSize: 20, color: Colors.indigo),
                        ),
                        const Text(
                          " stability of our handicapped people. ",
                          style: TextStyle(fontSize: 20, color: Colors.indigo),
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {

                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const OnBoardingScreen2(),
                                      ),
                                      (route) => false);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_sharp,
                                  color: Colors.indigo,
                                  size: 30,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),


               Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'First time to use Auxilium?',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          PreferencesHelper.instance.setIsOpened(true);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RegisterScreen(),
                              ),
                                  (route) => false);
                        },
                        child: Text(
                          'SIGNUP',
                        ),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.indigo[400]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          PreferencesHelper.instance.setIsOpened(true);

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                                  (route) => false);
                        },
                        child: Text(
                          'SIGNIN',
                          style: TextStyle(),
                        ),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.indigo[400]),
                      ),
                    ],
                  ),
                ],
              ),

          ],
        ),
      ),
    );
  }
}
