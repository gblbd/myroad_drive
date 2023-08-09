



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TravelRequestDetail extends StatelessWidget{


  final String traveller_name;
  final String traveller_phoneNumber;
  final String travel_date;
  final String pickupPoint;

  const TravelRequestDetail({super.key, required this.traveller_name, required this.traveller_phoneNumber, required this.travel_date, required this.pickupPoint});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [


          ListTile(
            title: Text("${travel_date}"),
            subtitle: Column(
              children: [
                Text("${traveller_name}"),
                InkWell(
                    child: Text("${traveller_phoneNumber}"),
                ),



              ],
            ),
          ),


          ListTile(
            title: Column(
              children: [
                Text("pickup Point"),

                Text("Traveller Destinations : "),

              ],
            ),
          ),



          ElevatedButton(onPressed: (){

          },
              child: Text("pick up request")
          )



        ],
      ),
    );
  }

}