

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myroad_drive/riding_status.dart';
import 'package:sizer/sizer.dart';

class RunningRequest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Accepting Request"),
      ),
      body: SingleChildScrollView(
        child: Column(
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

                  Text("Estimated 35 minits Journey",


                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600
                    ),


                  ),


                  Text("Fear : 450 BDT",

                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600
                    ),

                  ),


                ],
              ),
            ),
           // Text("Contact No. : +8801797609439"),

            //Text("Estimated Time : 35 minits "),

            Text("Enter Pickup code : ",

              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),

            ),

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
                  //maxLength: 11,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RidingStatus();
                            },
                          ),
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward_ios
                      ),
                    ),
                    border: InputBorder.none,
                    labelText: "Enter pickup code",
                    labelStyle: TextStyle(color: Colors.grey),
                    // counterText: '$_characterCount / 11',
                  ),

                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red



                  //onChanged: (input) => _validatePhoneNumber(input),
                ),
              ),

            ),


           // Text("Enter Dropping code code : "),


            Visibility(
              child: Container(
                height: 70,width: 320,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1.0),
                    borderRadius: BorderRadius.circular(3)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8,left: 10),
                  child: TextFormField(
                    //controller: _controller,
                    //maxLength: 11,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        child: Icon(
                          Icons.arrow_forward_ios
                        ),
                      ),
                      border: InputBorder.none,
                      labelText: "Enter Dropping Code",
                      labelStyle: TextStyle(color: Colors.grey),
                      // counterText: '$_characterCount / 11',
                    ),

                    keyboardType: TextInputType.number,
                    cursorColor: Colors.red,
                    //onChanged: (input) => _validatePhoneNumber(input),
                  ),
                ),
              ),
              visible: false,
            ),




          ],
        ),
      ),
    );
  }

}