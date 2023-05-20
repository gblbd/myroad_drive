

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RunningRequest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [

          Text("Request from : Name"),
          Text("Journey from : "),
          Text("Uttara"),
          Text("To"),
          Text("Khilkhet"),
          Text("Contact No. : +8801797609439"),
          Text("Fear : 450 BDT"),
          Text("Estimated Time : 35 minits "),

          Text("Enter Pickup code : "),

          Container(
            height: 70,width: 320,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 1.0),
                borderRadius: BorderRadius.circular(3)
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8,left: 10),
              child: TextFormField(
                //controller: _controller,
                maxLength: 11,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Enter Your Mobile Number",
                  labelStyle: TextStyle(color: Colors.grey),
                  // counterText: '$_characterCount / 11',
                ),

                keyboardType: TextInputType.number,
                cursorColor: Colors.red,
                //onChanged: (input) => _validatePhoneNumber(input),
              ),
            ),
          ),




        ],
      ),
    );
  }

}