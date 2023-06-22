import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget
{
  final String userId;
  // ignore: use_key_in_widget_constructors
  const MyMap(this.userId);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  // final loc.Location location = loc.Location();
  late GoogleMapController _controller;
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('location').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (_added) {
          myMap(snapshot);
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        // return ListView.builder(
        //   itemCount: snapshot.data?.docs.length,
        //   itemBuilder: (BuildContext context, int index) {
            return GoogleMap(
              mapType: MapType.normal,
              markers: {
                Marker(
                  position: LatLng(
                    snapshot.data!.docs.singleWhere(
                        (element) => element.id == widget.userId)['latitude'],
                    snapshot.data!.docs.singleWhere(
                        (element) => element.id == widget.userId)['longitude'],
                  ),
                  markerId: const MarkerId('id'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueMagenta),
                ),
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                    snapshot.data!.docs.singleWhere(
                        (element) => element.id == widget.userId)['latitude'],
                    snapshot.data!.docs.singleWhere(
                        (element) => element.id == widget.userId)['longitude'],
                  ),
                  zoom: 14.47),
              onMapCreated: (GoogleMapController controller) async {
                setState(() {
                  _controller = controller;
                  _added = true;
                });
              },
            );
          //},
      //  );
      }),
    ));
  }

  Future<void> myMap(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            snapshot.data!.docs.singleWhere(
                (element) => element.id == widget.userId)['latitude'],
            snapshot.data!.docs.singleWhere(
                (element) => element.id == widget.userId)['longitude'],
          ),
          zoom: 14.47,
        ),
      ),
    );
  }
}
