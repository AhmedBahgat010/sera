// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MapPage(),
//     );
//   }
// }
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   GoogleMapController? mapController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map Page'),
//       ),
//       body: GoogleMa(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(0, 0), // Initial location (you may want to replace this)
//           zoom: 10.0,
//         ),
//         // Other optional parameters
//       ),
//     );
//   }
//
//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       mapController = controller;
//     });
//   }
// }