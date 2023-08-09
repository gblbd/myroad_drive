



import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'travel_request_detail.dart';

class TourRequest extends StatelessWidget{





  Query dbref=FirebaseDatabase.instance.ref("Haritage_Tour_Request").child("ride_request");

   //TourRequest({super.key, required this.traveller_name, required this.traveller_phoneNumber, required this.travel_date, required this.pickupPoint});



  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [



            FirebaseAnimatedList(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              query: dbref,
              reverse: false,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                return Container(
                  margin: EdgeInsets.all(8),
                  child: Card(
                      child: ListTile(

                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TravelRequestDetail(
                                  travel_date: "${snapshot.child("Starting_date").value.toString()}",
                                  traveller_name: "${snapshot.child("Traveller_Name").value.toString()}",
                                  traveller_phoneNumber: "${snapshot.child("traveller_Phone").value.toString()}",
                                  pickupPoint: '${snapshot.child("traveller_Phone").value.toString()}',
                                );
                              },
                            ),
                          );
                        },
                        title: Text("${snapshot.child("Starting_date").value.toString()}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Traveller : ${snapshot.child("Traveller_Name").value.toString()}"),
                            Text("Phone : ${snapshot.child("traveller_Phone").value.toString()}"),

                          ],
                        ),

                      )

                  ),
                );
              },
            )


          ],
        ),
      ),
    );
  }

}