

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestDetail extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Column(
        children: [
          Text("Name"),
          Text("Contact No: +8801797609439"),
          Text("Request for Journey from:"),
          Text("Uttara"),
            Text("to"),
            Text("Khilkhet"),
          Text("Estimated Fair : 650 BDT"),
          Text("Estimated Time for Journey : 35 minits"),


          ElevatedButton(
              onPressed: (){




          }, child: Text("Accept Request And Call"))


        ],
      ),

    );
  }

}