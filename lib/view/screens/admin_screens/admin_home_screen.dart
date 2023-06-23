import 'package:flutter/Material.dart';
import '../../../config/style.dart';
import '../location_screens/map_screen.dart';
import '../location_screens/share_location.dart';
import '../patient_screens/medicine_screens/check_medicine.dart';
import '../patient_screens/medicine_screens/manage_medicine.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                gradient: const LinearGradient(
                    colors: [Colors.teal, Colors.indigoAccent, Colors.indigo])),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ManageMedicine()));
                  },
                  child: const Text(
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
                              builder: (_) => const ManageMedicine()));
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
                gradient: const LinearGradient(
                    colors: [Colors.teal, Colors.indigoAccent, Colors.indigo])),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CheckMedicine(),
                      ),
                    );
                  },
                  child: const Text(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CheckMedicine()));
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                    size: 25,
                  ),
                )
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
                gradient: const LinearGradient(
                    colors: [Colors.teal, Colors.indigoAccent, Colors.indigo])),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ShareScreen()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ShareScreen()));
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
      ],
    );
  }
}
