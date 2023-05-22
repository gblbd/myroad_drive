

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              width: 100.w,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.red.shade100
              ),
              child: ListTile(

                leading: Container(

                  width: 25.w,
                  height: 18.h,
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
                title: Text("Name",

                  style: GoogleFonts.openSans(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),

                ),
                subtitle: Text("+8801XXXXXXXXX"),
              ),
            ),

            Text("Name : Example Name"),

            Text("Phone Number : +8801XXXXXXXXXXX"),

            Text("Driving Licence No. : XXXXXXXXXXXXX"),

            Text("Vehicle Registration No. XXXXXXXXXXXXXX"),











          ],
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             FlightHistory()
            //     )
            // );

          },
          label: Text("Edit"),
          hoverElevation: 100,
          icon: Icon(Icons.edit),
          splashColor: Colors.purple,

          backgroundColor: Colors.pink.shade500,
        ),
      ),



    );
  }
  
}