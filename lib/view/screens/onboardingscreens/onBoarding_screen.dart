import 'package:flutter/Material.dart';
import 'package:lottie/lottie.dart';

import 'onBoarding_screen2.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
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
          Center(
            child: Container(
              width: 380,
              height: 489,
              decoration: const BoxDecoration(color: Colors.white70),
              child: Column(
                children: [
                  Lottie.asset(
                    "asset/lottie/wheelchair.json",
                    width: 250,
                    height: 250,
                    repeat: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "What is Auxilium?",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "A wheelchair which can be controlled ",
                    style: TextStyle(fontSize: 20, color: Colors.indigo),
                  ),
                  const Text(
                    "  by hand glove and mobile application ",
                    style: TextStyle(fontSize: 20, color: Colors.indigo),
                  ),
                  const SizedBox(
                    height: 30,
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
                                (route) => true);
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.indigo,
                            size: 30,
                          ))
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
