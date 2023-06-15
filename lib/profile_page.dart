

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myroad_drive/edit_profile.dart';
import 'package:sizer/sizer.dart';



class ProfilePage extends StatelessWidget{

  final String DfullName;
  final String DphoneNum;
  final String Daddress;
  final String DdateOfBirth;
  final String Dgender;
  final String DnidNum;
  final String DvehicleType;
  final String DvehicleModel;
  final String DvehicleRegNum;
  final String DdrivingLicenceNum;

  const ProfilePage({Key? key, required this.DfullName, required this.DphoneNum, required this.Daddress, required this.DdateOfBirth, required this.Dgender, required this.DnidNum, required this.DvehicleType, required this.DvehicleModel, required this.DvehicleRegNum, required this.DdrivingLicenceNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                width: 100.w,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.red.shade50
                ),
                child: ListTile(

                  leading: Container(

                    width: 25.w,
                    height: 18.h,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: Icon(Icons.person,color: Colors.blueGrey,),
                    ),
                  ),
                  title: Text("Name: ${DfullName}",

                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),

                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone Number: ${DphoneNum}"),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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






              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address",
                            style: GoogleFonts.openSans(
                                fontSize: 16,fontWeight: FontWeight.w600
                            ),
                          ),
                          Text("${Daddress}",
                            style: GoogleFonts.openSans(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Date Of Birth",
                                style: GoogleFonts.openSans(
                                    fontSize: 16,fontWeight: FontWeight.w600
                                ),
                              ),
                              Text("${DdateOfBirth}",
                                style: GoogleFonts.openSans(
                                    fontSize: 14,fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Gender",
                                style: GoogleFonts.openSans(
                                    fontSize: 16,fontWeight: FontWeight.w600
                                ),
                              ),
                              Text("${Dgender}",
                                style: GoogleFonts.openSans(
                                    fontSize: 14,fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 20,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("NID Number",
                            style: GoogleFonts.openSans(
                                fontSize: 16,fontWeight: FontWeight.w600
                            ),
                          ),
                          Text("${DnidNum}",
                            style: GoogleFonts.openSans(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Vehicle Type",
                                style: GoogleFonts.openSans(
                                    fontSize: 16,fontWeight: FontWeight.w600
                                ),
                              ),
                              Text("${DvehicleType}",
                                style: GoogleFonts.openSans(
                                    fontSize: 14,fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Vehicle Model",
                                style: GoogleFonts.openSans(
                                    fontSize: 16,fontWeight: FontWeight.w600
                                ),
                              ),
                              Text("${DvehicleModel}",
                                style: GoogleFonts.openSans(
                                    fontSize: 14,fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("Vehicle Registration Number",
                            style: GoogleFonts.openSans(
                                fontSize: 16,fontWeight: FontWeight.w600
                            ),
                          ),
                          Text("${DvehicleRegNum}",
                            style: GoogleFonts.openSans(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 20,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("Driving Licence Number",
                            style: GoogleFonts.openSans(
                                fontSize: 16,fontWeight: FontWeight.w600
                            ),
                          ),
                          Text("${DdrivingLicenceNum}",
                            style: GoogleFonts.openSans(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),

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
                ),
              )














            ],
          ),
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