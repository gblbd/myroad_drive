



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TravelRequestDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [

          Text("Traveller Name"),
          Text("Phone"),
          Text("pickup Point"),
          Text("Travel Date"),
          Text("Traveller Destinations : "),



          ElevatedButton(onPressed: (){

          }, child: Text("pick up request"))



        ],
      ),
    );
  }

}