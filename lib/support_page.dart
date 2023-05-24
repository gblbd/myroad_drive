



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SupportPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Support"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: 20,
              ),


              Image.asset(
                "assets/support.gif",
                height: 35.h,
                width: 100.w,
              ),

              SizedBox(
                height: 20,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [




                  Text("Email: info@gbl-bd.com",

                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),


                  ),
                ],
              ),

              SizedBox(height: 20,),

              Text("Phone: 022224470053",

                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),



              ),



            ],
          ),
        ),
      ),
    );
  }

}