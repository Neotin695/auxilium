import 'dart:async';

import 'package:auxilium2/model/location_model.dart';
import 'package:auxilium2/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class LocSerivces {
  final loc.Location _location = loc.Location();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  bool listening = false;
  bool get isListening => listening;
  StreamSubscription<loc.LocationData>? _locationSubscription;

  Future<void> fetchCurrentLocation(UserModel user) async {
    try {
      final loc.LocationData result = await _location.getLocation();
      await _db.collection('location').doc(user.idDoc).set(
          LocationModel(
            latitude: result.latitude!,
            longitude: result.longitude!,
          ).toMap(),
          SetOptions(merge: true));
    } catch (err) {
      print(err);
    }
  }

  Future<void> myRequestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      await myRequestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> listenToLocation(UserModel user) async {
    _locationSubscription = _location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      _locationSubscription = null;
    }).listen((event) async {
      listening = true;
      await _db.collection('location').doc(user.idDoc).set(
            LocationModel(
              latitude: event.latitude!,
              longitude: event.longitude!,
            ).toMap(),
          );
    });
  }

  void stopListenToLocation(user) {
    listening = false;
    _locationSubscription?.cancel();
    _locationSubscription = null;
  }
}
