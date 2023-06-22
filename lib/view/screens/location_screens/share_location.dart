import 'package:auxilium2/controller/loc_services.dart';
import 'package:auxilium2/model/location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

import '../../../config/preferences_helper.dart';
import '../../../config/style.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  Position? position;
  final loc.Location location = loc.Location();
  late GoogleMapController mapController;
  bool added = false;
  late LocSerivces locSerivces;
  @override
  void initState() {
    locSerivces = LocSerivces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LocSerivces().fetchCurrentLocation(PreferencesHelper.instance.getUser()!);
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('location')
            .doc(PreferencesHelper.instance.getUser()!.idDoc)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            final location = LocationModel.fromMap(
                snapshot.data!.data() as Map<String, dynamic>);
            if (added) {
              updateCamer(location);
            }
            return Scaffold(
              body: Column(
                children: [
                  _customAppBar(context),
                  Expanded(
                    child: GoogleMap(
                      mapType: MapType.satellite,
                      markers: {
                        Marker(
                          markerId: const MarkerId('id'),
                          position:
                              LatLng(location.latitude, location.longitude),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueMagenta,
                          ),
                        ),
                      },
                      initialCameraPosition: CameraPosition(
                          target:
                              LatLng(location.latitude, location.longitude)),
                      onMapCreated: (controller) {
                        mapController = controller;
                        added = true;
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
              bottomNavigationBar: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300),
                          gradient: const LinearGradient(colors: [
                            Colors.teal,
                            Colors.indigoAccent,
                            Colors.indigo
                          ])),
                      child: IconButton(
                          onPressed: () async {
                            await locSerivces.listenToLocation(
                                PreferencesHelper.instance.getUser()!);
                          },
                          icon: const Icon(
                            Icons.location_on,
                            size: 40,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300),
                          gradient: const LinearGradient(colors: [
                            Colors.teal,
                            Colors.indigoAccent,
                            Colors.indigo
                          ])),
                      child: IconButton(
                          onPressed: () async {
                            await locSerivces.fetchCurrentLocation(
                                PreferencesHelper.instance.getUser()!);
                          },
                          icon: const Icon(
                            Icons.share_location,
                            size: 40,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300),
                          gradient: const LinearGradient(colors: [
                            Colors.teal,
                            Colors.indigoAccent,
                            Colors.indigo
                          ])),
                      child: IconButton(
                          onPressed: () {
                            locSerivces.stopListenToLocation(
                                PreferencesHelper.instance.getUser()!);
                          },
                          icon: const Icon(
                            Icons.stop_circle,
                            size: 40,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: Text('somthing went wrong!!'));
        },
      ),
    );
  }

  updateCamer(user) async {
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(user.latitude, user.longitude),
          zoom: 14,
        ),
      ),
    );
  }

  Container _customAppBar(BuildContext context) {
    return Container(
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
        children: [
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              const SizedBox(
                width: 35,
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
                width: 60,
              ),
              const Text(
                "Location",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
