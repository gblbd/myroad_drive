

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myroad_drive/running_request.dart';
import 'package:sizer/sizer.dart';

class RequestDetail extends StatelessWidget
{

  final String Name;
  final String phoneNumb;
  final String pickUp;
  final String destination;
  final String Estimated_distance;
  final String Estimated_fare;
  final String id;
  final String vehicleType;
  final String DriverNumb;
  final String PickUpCode;
  final String DropdownCode;

  const RequestDetail({super.key, required this.Name, required this.phoneNumb, required this.pickUp, required this.destination, required this.Estimated_distance, required this.Estimated_fare, required this.id, required this.vehicleType, required this.DriverNumb, required this.PickUpCode, required this.DropdownCode});




  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    DatabaseReference rf = FirebaseDatabase.instance.ref("${vehicleType}");


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
                Text("${Name}",

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
                Text("${destination}\n",

                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),

                ),

                SizedBox(
                  height: 10,
                ),

                Text("Estimated distance : ${Estimated_distance}",


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
                  Text("${Estimated_fare} BDT",

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


                  DatabaseReference senderPostRef = rf.child("ride_request").child("${id}");
                  senderPostRef.update({

                    "pickUpStat":true,
                    "picupBy":"${DriverNumb}",

                  }).then((value) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RunningRequest(

                            Name: Name,
                            phoneNumb: phoneNumb,
                            pickUp: pickUp,
                            destination: destination,
                            Estimated_distance: Estimated_distance,
                            Estimated_fare: Estimated_fare,
                            id: id,
                            vehicleType: vehicleType,
                            DriverNumb: DriverNumb,
                            PickUpCode: PickUpCode,
                            Dropdowncode: DropdownCode,

                          );
                        },
                      ),
                    );

                  });





                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return RunningRequest();
                  //     },
                  //   ),
                  // );



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