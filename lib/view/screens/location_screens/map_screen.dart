// import 'package:auxilium2/config/style.dart';
// import 'package:flutter/Material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   GoogleMapController? _controller;
//
//   static CameraPosition? _kGooglePlex = const CameraPosition(
//     target: LatLng(
//       30.033333,
//       31.233334,
//     ),
//     zoom: 10,
//   );
//
//   // Location location = Location();
//
//   bool _serviceEnabled = false;
//   // PermissionStatus? _permissionGranted;
//   // LocationData? _locationData;
//
//   Set<Marker> marker = {};
//
//   MapType mapType = MapType.normal;
//
//   @override
//   void initState() {
//     super.initState();
//     getLocation();
//   }
//
//   getLocation() async {
//     // _serviceEnabled = await location.serviceEnabled();
//     // if (!_serviceEnabled) {
//     //   _serviceEnabled = await location.requestService();
//     //   if (!_serviceEnabled) {
//     //     return;
//     //   }
//     // }
//
//     // _permissionGranted = await location.hasPermission();
//     // if (_permissionGranted == PermissionStatus.denied) {
//     //   _permissionGranted = await location.requestPermission();
//     //   if (_permissionGranted != PermissionStatus.granted) {
//     //     return;
//     //   }
//     // }
//
//     // _locationData = await location.getLocation();
//
//     // if (_locationData != null) {
//       // setState(() {
//         // marker.add(
//           // Marker(
//             // markerId: const MarkerId('fajooor'),
//             // position: LatLng(
//               // _locationData?.latitude ?? 30.033333,
//               // _locationData?.longitude ?? 31.233334,
//             // ),
//           // ),
//         // );
//       // });
//
//       _kGooglePlex = CameraPosition(
//         target: LatLng(
//           // _locationData?.latitude ?? 30.033333,
//           // _locationData?.longitude ?? 31.233334,
//         ),
//         zoom: 20,
//       );
//
//       _controller!.animateCamera(
//         CameraUpdate.newCameraPosition(_kGooglePlex!),
//       );
//     }
//   }
//
//   changeMapType() {
//     switch (mapType) {
//       case MapType.satellite:
//         mapType = MapType.normal;
//         break;
//       case MapType.normal:
//         mapType = MapType.satellite;
//         break;
//
//       default:
//     }
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton.extended(
//         label: Row(
//           children: const [
//             Icon(Icons.map),
//             SizedBox(width: 10),
//             Text('Map Type'),
//           ],
//         ),
//         onPressed: () {
//           changeMapType();
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       body: Column(
//         children: [
//           Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 112,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.teal,
//                       Colors.indigoAccent,
//                       Colors.indigo,
//                     ],
//                   ),
//                   borderRadius: AppStyle.roundCorners,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(
//                       height: 35,
//                     ),
//                     Row(
//                       children: [
//                         const SizedBox(
//                           width: 35,
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: const Icon(
//                               Icons.arrow_back_ios,
//                               color: Colors.white,
//                               size: 30,
//                             )),
//                         const SizedBox(
//                           width: 85,
//                         ),
//                         const Text(
//                           "Map",
//                           style: TextStyle(color: Colors.white, fontSize: 30),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 15),
//             ],
//           ),
//           Expanded(
//             child: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(20),
//                 topLeft: Radius.circular(20),
//               ),
//               child: GoogleMap(
//                 mapType: mapType,
//                 initialCameraPosition: _kGooglePlex!,
//                 markers: {
//                   ...marker,
//                 },
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller = controller;
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
