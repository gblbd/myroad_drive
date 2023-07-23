import 'package:flutter/material.dart';

class GoogleMap extends StatefulWidget {
  const GoogleMap({super.key});

  @override
  State<GoogleMap> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: GoogleMap(

     ),
    );
  }
}
