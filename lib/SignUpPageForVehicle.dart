import 'package:flutter/material.dart';

import 'SignUpForCar.dart';

class SignUpPageForVehicle extends StatelessWidget {
  const SignUpPageForVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Select Vehicle',
              style: TextStyle(color: Colors.black,
                fontSize: 20,
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: Icon(Icons.car_crash_outlined,color: Colors.white,size: 20,),
                title: Text('Car',style: TextStyle(color: Colors.white),
              ),
                trailing: Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.white,),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpForCar();
                      },
                    ),
                  );
                },
                tileColor: Colors.red,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: Icon(Icons.motorcycle_sharp,color: Colors.white,size: 20,),
                title: Text('Bike',
                style: TextStyle(color: Colors.white),
              ),
                trailing: Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.white,),
                onTap: (){

                },
                tileColor: Colors.red,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: Icon(Icons.electric_rickshaw_sharp,color: Colors.white,size: 20,),
                title: Text('CNG',
                style: TextStyle(color: Colors.white),

              ),
                trailing: Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.white,),
                onTap: (){

                },
                tileColor: Colors.red,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: Icon(Icons.pedal_bike_outlined,color: Colors.white,size: 20,),

                title: Text('Bicycle',
                style: TextStyle(color: Colors.white),

              ),
                trailing: Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.white,),
                onTap: (){

                },
                tileColor: Colors.red,
              ),

            ),
          ],
        ),
      ),
    );
  }
}
