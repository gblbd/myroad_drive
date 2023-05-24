



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

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




                  InkWell(
                    onTap: (){
                      UrlLauncher.launch('mailto:nafim15-11104@diu.edu.bd');
                    },
                    child: Text("Email: info@gbl-bd.com",

                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),


                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),

              InkWell(
                onTap: (){
                  UrlLauncher.launch('tel: 01797609439');
                },
                child: Text("Phone: 022224470053",

                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
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