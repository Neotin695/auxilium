import 'package:flutter/Material.dart';

import '../../../config/style.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({Key? key}) : super(key: key);

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 110,
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
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "Medical History",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            child: ListView.builder(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration:  BoxDecoration(
                           border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.indigoAccent,
                              width: 2
                          ),
                          borderRadius:BorderRadius.circular(40)

                    ),

                  );

                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.mode_edit,
            color: Colors.white,
          )),
    );
  }
}
