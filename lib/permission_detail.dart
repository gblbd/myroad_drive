

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'LoginScreen.dart';
import 'WelcomeScreen.dart';




//import 'LoginWithPhoneNum.dart';

class PermissionDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Permission Detail"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Text("Location : ",

                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),


              ),
              Text("\nThis app will use your location data for app functionality and for best user experience."
                  " this location data will be collected only when you use the app."
                  " The location data collection doesn't run or work in the background. "
                  "It doesn't collect or share data when the app will remain idle. "
                  "This location data is used for the feature of finding user's location."
                  " My road drive collect location for finding nearest passengers. My road drive collect location data ,"
                  " calulate the distance from user to passenger and show the nearest passengers list"
                  ". If My Road Drive collect background location data, My Road Drive"
                  " want to ensure that the data is safe and secure and data will never collected without user's permission"
                  "This app collects"
                  " location data to enable User's realtime location finding feature, nearest customer finding feature and  even when the app"
                  " is closed or not in use. This data will never use to provide ads/support advertising/support ads  "
                  "this app never provide any ads/support or advertising/support ads.",

                style: GoogleFonts.openSans(
                    fontSize: 16,
                    //fontWeight: FontWeight.bold
                ),

              ),
              Text("User Data Safty :",

                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),

              ),
              Text("\nMy road never use, analyze or share user data. "
                  "The data transfered through a encrypted channel with firebase security \n\n\n\n If you are agree with us please press the agree button and enjoy the best experience",

                style: GoogleFonts.openSans(
                  fontSize: 16,
                  //fontWeight: FontWeight.bold
                ),

              ),
              SizedBox(height: 25,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Container(
                    height: 45,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color:Colors.red
                    ),
                    child: TextButton(
                      onPressed: () {

                        Navigator.pop(context);


                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WelcomeScreen())
                            );







                      },
                      child: Text('Agree',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }

}