import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';
TextEditingController aEmailController = TextEditingController();
TextEditingController pEmailController = TextEditingController();
TextEditingController aPasswordController = TextEditingController();
TextEditingController pPasswordController = TextEditingController();
TextEditingController aNameController = TextEditingController();
TextEditingController pNameController = TextEditingController();
final fireStore = FirebaseFirestore.instance;
 String collectionName='';
addUser()
{
  collectionName='users';
  fireStore.collection(collectionName).add(
      {
        'adminEmail' : aEmailController.text,
        'adminName':aNameController.text,
        'adminPassword' : aPasswordController.text,
        'patientEmail' : pEmailController.text,
        'patientName':pNameController.text,
        'patientPassword':pPasswordController.text,

      }
  );
}
