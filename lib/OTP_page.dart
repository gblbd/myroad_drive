import 'package:flutter/material.dart';
import 'package:myroad_drive/vehicle_reg.dart';
import 'package:myroad_drive/SignUpPageForVehicle.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _isPhoneNumberValid=false;

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
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            OTPTextField(
              length: 6,
              width: 360,
              fieldWidth: 50,
              style: TextStyle(
                  fontSize: 10
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
            onChanged: (pin) {
              //print("Changed: " + pin);
            },
            onCompleted: (pin) {

                setState(() {
                  _isPhoneNumberValid=true;
                });

              //print("Completed: " + pin);
            }),



            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 10),
              child: Container(
                height: 50,width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: _isPhoneNumberValid ? Colors.red : Colors.grey
                ),
                child: TextButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: _isPhoneNumberValid ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpForCar();
                        },
                      ),
                    );
                  } : null,
                  child: Text('NEXT',
                    style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              ),
            ),


          ],
        ),
      )

      // Center(
      //   child: Column(
      //     children: [
      //       Text('Select City',
      //         style: TextStyle(color: Colors.black,
      //         fontSize: 20,
      //         ),
      //
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: ListTile(title: Text('Dhaka',style: TextStyle(color: Colors.white),
      //         ),
      //         trailing: Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.white,),
      //           onTap: (){
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) {
      //                   return SignUpForCar();
      //                 },
      //               ),
      //             );
      //           },
      //           tileColor: Colors.red,
      //         ),
      //       ),
      //
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: ListTile(title: Text('Chittagong',
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         trailing: Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.white,),
      //           onTap: (){
      //
      //           },
      //           tileColor: Colors.red,
      //         ),
      //       ),
      //
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: ListTile(title: Text('Sylhet',
      //           style: TextStyle(color: Colors.white),
      //
      //         ),
      //         trailing: Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.white,),
      //           onTap: (){
      //
      //           },
      //           tileColor: Colors.red,
      //         ),
      //       ),
      //
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: ListTile(title: Text('Khulna',
      //           style: TextStyle(color: Colors.white),
      //
      //         ),
      //         trailing: Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.white,),
      //           onTap: (){
      //
      //           },
      //           tileColor: Colors.red,
      //         ),
      //
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
