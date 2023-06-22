import 'package:auxilium2/view/screens/onboardingscreens/onBoarding_screen3.dart';
import 'package:flutter/Material.dart';
import 'package:lottie/lottie.dart';

import 'onBoarding_screen.dart';

class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen2> createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
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
          Center(
            child: Container(
              width: 380,
              height: 489,
              decoration: const BoxDecoration(color: Colors.white70),
              child: Column(
                children: [
                  Lottie.asset(
                    "asset/lottie/playing.json",
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
                    "Supporting handicapped people",
                    style: TextStyle(fontSize: 20, color: Colors.indigo),
                  ),
                  const Text(
                    "to live their own life.",
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
                                  builder: (_) => const OnBoardingScreen(),
                                ),
                                (route) => true);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.indigo,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const OnBoardingScreen3(),
                                ),
                                    (route) => true);
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.indigo,
                            size: 30,
                          )),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
