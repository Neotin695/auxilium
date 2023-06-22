import 'package:auxilium2/view/screens/patient_screens/medical_history_screen.dart';
import 'package:auxilium2/view/screens/location_screens/share_location.dart';
  import 'package:flutter/Material.dart';
import '../../../config/style.dart';
import 'controller_screen.dart';
import 'medicine_screens/check_medicine.dart';
import 'medicine_screens/manage_medicine.dart';


class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
              children: const [
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Auxilium",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Support is our duty",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(colors: [
                    Colors.teal,
                    Colors.indigoAccent,
                    Colors.indigo
                  ])),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ControllerScreen()));
                    },
                    child: const Text(
                      "Control your chair",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) =>  ControllerScreen()));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                        size: 25,
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(colors: [
                    Colors.teal,
                    Colors.indigoAccent,
                    Colors.indigo
                  ])),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) =>const ShareScreen()));
                    },
                    child: const Text(
                      "Check Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) =>ShareScreen()));
                      },
                      icon:const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                        size: 25,
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient:const LinearGradient(colors: [
                    Colors.teal,
                    Colors.indigoAccent,
                    Colors.indigo
                  ])),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) =>const CheckMedicine()));
                    },
                    child:const Text(
                      "Check Medicine",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) =>const CheckMedicine()));
                      },
                      icon:const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                        size: 25,
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(colors: [
                    Colors.teal,
                    Colors.indigoAccent,
                    Colors.indigo
                  ])),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) =>const ManageMedicine()));
                    },
                    child:const Text(
                      "Manage Medicine",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>const ManageMedicine()));
                      },
                      icon:const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                        size: 25,
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient:const LinearGradient(colors: [
                    Colors.teal,
                    Colors.indigoAccent,
                    Colors.indigo
                  ])),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MedicalHistory()));
                    },
                    child:const Text(
                      "Medical History",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MedicalHistory()));
                      },
                      icon:const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                        size: 25,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
