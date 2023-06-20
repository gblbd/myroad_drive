

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myroad_drive/riding_status.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class RunningRequest extends StatelessWidget{


  final String Name;
  final String phoneNumb;
  final String pickUp;
  final String destination;
  final String Estimated_distance;
  final String Estimated_fare;
  final String id;
  final String vehicleType;
  final String DriverNumb;

  const RunningRequest({super.key, required this.Name, required this.phoneNumb, required this.pickUp, required this.destination, required this.Estimated_distance, required this.Estimated_fare, required this.id, required this.vehicleType, required this.DriverNumb});

  Future<void> makeCall() async {
    var url = Uri.parse("tel:${phoneNumb}");

    await launchUrl(url);

  }



  @override
  Widget build(BuildContext context) {

    makeCall();


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
                  Text("Contact No: ${phoneNumb}",

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

                  Text("${pickUp}",

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
                  Text("${destination}",

                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),

                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text("${Estimated_distance}",


                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600
                    ),


                  ),


                  Text("${Estimated_fare}",

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