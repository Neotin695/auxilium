import 'package:flutter/Material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal,
              Colors.indigoAccent,
              Colors.indigo,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "EMERGENCY ",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              height: 580,
              width: 350,
              decoration: const BoxDecoration(color: Colors.white70),
              child: Column(
                children: [
                  LottieBuilder.asset("asset/lottie/emergency.json"),
                  Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              launchUrl(Uri.parse('tel://122'));
                            },
                            icon: const Icon(
                              Icons.phone,
                              color: Colors.white,
                            )),
                        const Text(
                          "CALL",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const Text(
                          " POL",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const Text(
                          "ICE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const Text(
                          " 122",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              launchUrl(Uri.parse('tel://123'));
                            },
                            icon: const Icon(
                              Icons.phone,
                              color: Colors.white,
                            )),
                        const Text(
                          "CALL",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const Text(
                          " AMBU",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const Text(
                          "LANCE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const Text(
                          " 123",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
