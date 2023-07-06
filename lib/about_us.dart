



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUS extends StatelessWidget{












  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("About us"),
      ),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [

              Text("My Road : ",

                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),


              ),
              Text("My Road is an innovative new entrant into the tech market in Bangladesh,"
                  " Operated and owned by Bangladesh for Bangladeshi people, "
                  "My Road brings local creativity and insights to get improving the experience "
                  "of Air Tickiting,Hotel Booking,Foods,Couriers, passengers and drivers."
                  " My Road provides you in best class solution.",

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
              Text("\nMy Road Drive never use, analyze or share user data. It collect document file for the sucurity perpose of the users."
                  " for this, we need storage permission"
                  "The data transfered through a encrypted channel with firebase security ",

                style: GoogleFonts.openSans(
                  fontSize: 16,
                  //fontWeight: FontWeight.bold
                ),

              ),
              SizedBox(height: 25,),



            ],
          ),
        ),
      )
    );
  }

}