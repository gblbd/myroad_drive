

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myroad_drive/running_request.dart';
import 'package:sizer/sizer.dart';

class RequestDetail extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("Request Detail"),
      ),

      body: Column(
        children: [
          
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red.shade100
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name",

                  style: GoogleFonts.openSans(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),

                ),
                Text("Contact No: +8801797609439",

                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),

                ),
              ],
            ),
          ),


          Container(


            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.shade100
            ),


            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("Requested Ride:",

                      style: GoogleFonts.openSans(
                          fontSize: 21,
                          fontWeight: FontWeight.bold
                      ),

                    ),
                  ],
                ),

                SizedBox(height: 15,),

                Text("Uttara",

                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),

                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_downward),
                    Icon(Icons.arrow_upward),
                  ],
                ),


                // Text("to",
                //
                //   style: GoogleFonts.openSans(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold
                //   ),
                //
                // ),
                Text("Khilkhet",

                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),

                ),

                SizedBox(
                  height: 10,
                ),

                Text("Estimated Time for Journey : 35 minits",


                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600
                  ),


                ),
              ],
            ),
          ),
          
          
          

          Container(

              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red.shade100
              ),


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Estimated Fair :",
                style: GoogleFonts.openSans(
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                ),

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("650 BDT",

                    style: GoogleFonts.openSans(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800
                    ),

                  ),
                ],
              ),
            ],
          )),



          // ElevatedButton(
          //     onPressed: (){
          //
          //
          //
          //
          //
          //
          // }, child: Text("Accept Request And Call")),

          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 10),
            child: Container(
              height: 50,width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.red.shade600
              ),
              child: TextButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () async{


                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RunningRequest();
                      },
                    ),
                  );



                },
                child: Text('Accept Request And Call',
                  style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            ),
          ),


        ],
      ),

    );
  }

}