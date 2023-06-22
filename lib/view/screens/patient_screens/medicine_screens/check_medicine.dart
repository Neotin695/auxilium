import 'package:flutter/Material.dart';

import '../../../../config/style.dart';

class CheckMedicine extends StatefulWidget {
  const CheckMedicine({Key? key}) : super(key: key);

  @override
  State<CheckMedicine> createState() => _CheckMedicineState();
}

class _CheckMedicineState extends State<CheckMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      "Check Medicine",
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

    );
  }
}
