import 'package:auxilium2/view/screens/home_screen.dart';
import 'package:auxilium2/view/screens/sign_screens/login_screen.dart';
import 'package:flutter/Material.dart';
import 'package:lottie/lottie.dart';

import '../../config/preferences_helper.dart';
import 'onboardingscreens/onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return PreferencesHelper.instance.getIsOpened() == true
                    ? PreferencesHelper.instance.getSigned() == true
                        ? const HomeScreen()
                        : const LoginScreen()
                    : const OnBoardingScreen();
              },
            ), (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(41, 92, 151, 20),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Lottie.asset(
                "asset/lottie/indgiochair.json",
                width: 280,
                height: 280,
                repeat: false,
                // reverse: true,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "AUXILIUM",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              margin: const EdgeInsets.only(left: 200),
              child: const Text(
                "Support is our duty",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
