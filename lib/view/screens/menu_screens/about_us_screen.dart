import 'package:flutter/Material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/style.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
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
                      children:   [
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,)),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "About Auxilium",
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
              //end of appbar
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.teal,
                    Colors.indigoAccent,
                    Colors.indigo
                  ])),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.asset("asset/lottie/host.json"),
                      Text(
                        "To reduce the burden\n  of the people who\npush the wheelchair.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            // fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.teal,
                    Colors.indigoAccent,
                    Colors.indigo
                  ])),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "            Helping \nhandicapped people.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                           // fontWeight: FontWeight.bold
                        ),
                      ),
                      LottieBuilder.asset("asset/lottie/playing.json"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.teal,
                        Colors.indigoAccent,
                        Colors.indigo
                      ])),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.asset("asset/lottie/wheelchair.json",width: 150,height: 150,),
                      Text(
                        "Making usage of \nwheelchair easier.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.teal,
                        Colors.indigoAccent,
                        Colors.indigo
                      ])),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Making contact \nwith each other\n   much easier.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      LottieBuilder.asset("asset/lottie/emergency.json"),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.teal,
                        Colors.indigoAccent,
                        Colors.indigo
                      ])),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.asset("asset/lottie/indgiochair.json",width: 100,height: 100,),

                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "To develop a wheelchair \nwhich can be controlled \n    by hand glove and \n   mobile application.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.teal,
                        Colors.indigoAccent,
                        Colors.indigo
                      ])),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "Our team's duty\nis to support and\nglad to know\nyour feedback\nthanks in advance",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          LottieBuilder.asset("asset/lottie/contact.json",width: 190,height: 220,),
                        ],
                      ),
                      // ElevatedButton(onPressed: (){
                      //   // launchUrl(Uri.parse('tel://'));
                      // }, child: Text("Contact Us"),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
