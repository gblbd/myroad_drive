

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myroad_drive/edit_profile.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("+8801XXXXXXXXX"),
                    Row(
                      children: [
                        Icon(Icons.star,
                          color: Colors.amberAccent.shade700,

                        ),
                        Text(" 4.6",

                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            // Text("Name : Example Name",
            //
            // ),

            //Text("Phone Number : +8801XXXXXXXXXXX"),

            SizedBox(height: 20,),


            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Driving Licence No. : XXXXXXXXXXXXX",

                    style: GoogleFonts.openSans(
                        fontSize: 20
                    ),

                  ),
                  SizedBox(height: 20,),
                  Text("Vehicle Registration No. XXXXXXXXXXXXXX",

                    style: GoogleFonts.openSans(
                        fontSize: 20
                    ),

                  ),
                  SizedBox(height: 20,),

                  Text("Gender: Male",

                    style: GoogleFonts.openSans(
                        fontSize: 20
                    ),

                  ),
                  SizedBox(height: 20,),


                  Text("Language : English",

                    style: GoogleFonts.openSans(
                        fontSize: 20
                    ),

                  ),

                  SizedBox(height: 20,),

                  Divider(
                    thickness: 1,
                  ),

                  ListTile(

                    onTap: (){},
                    title: Text("Change password",

                      style: GoogleFonts.openSans(
                          fontSize: 20
                      ),

                    ),
                  ),

                  Divider(
                    thickness: 1,
                  ),




                ],
              ),
            )














          ],
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EditProfile()
                )
            );

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