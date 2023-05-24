

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(
          children: [


            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark Mode ",

                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),

                  ),

                  ToggleSwitch(
                    minWidth: 50.0,
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green.shade500!], [Colors.black!]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    labels: ['On', 'Off'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),


                ],
              ),
            ),




          ],
        ),
      ),
    );
  }

}