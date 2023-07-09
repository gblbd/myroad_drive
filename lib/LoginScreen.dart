

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myroad_drive/home_page.dart';
import 'package:myroad_drive/vehicle_reg.dart';
import 'package:permission_handler/permission_handler.dart';



import 'package:shared_preferences/shared_preferences.dart';


import 'CreateAccount.dart';

enum PermissionGroup {


  /// Android: Fine and Coarse Location
  /// iOS: CoreLocation - Always
  locationAlways,

  /// Android: Fine and Coarse Location
  /// iOS: CoreLocation - WhenInUse
  locationWhenInUse
}




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _Passcontroller = TextEditingController();
  final TextEditingController _number = TextEditingController();
///////////////////////////////////////////////////////
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("Driver_profile");
////////////////////////////////////////////////////////





  ///////////////////////////////////////////////////////







  bool _isObscure=true;

  @override
  Widget build(BuildContext context) {




    Perm();








    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 130,left: 16,right: 16,bottom: 0),
          child: Column(
            children: [
             // SizedBox(height: 120,),
              Center(child: Image.asset("assets/MyRoadDriveLogo.png",height: 80,)),
              SizedBox(height: 20,),

              Container(
                height: 70,width: 320,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1.0),
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8,left: 10),
                  child: TextFormField(
                    controller: _number,
                    maxLength: 11,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter Your Mobile Number",
                      labelStyle: TextStyle(color: Colors.grey),
                     // counterText: '$_characterCount / 11',
                    ),

                    keyboardType: TextInputType.number,
                    cursorColor: Colors.red,
                    //onChanged: (input) => _validatePhoneNumber(input),
                  ),
                ),
              ),
             //  Text('                                                                                  ${_phoneNumberCharacterCount} / 11',textAlign: TextAlign.end,),
              SizedBox(height: 20,),
              Container(
                height: 70,width: 320,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1.0),
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8,left: 10),
                  child: TextField(
                    controller: _Passcontroller,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter Your Password",
                      labelStyle: TextStyle(color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                        onPressed: (){
                          setState(() {
                            _isObscure= !_isObscure;
                          });
                        },
                      ),
                    ),

                    cursorColor: Colors.red,

                  ),
                ),
              ),

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


                      final snapshot_pass = await ref.child(_number.text.toString()).child("Dprofile").child("Password").get();
                      final snapshot_name = await ref.child(_number.text.toString()).child("Dprofile").child("Dfull_Name").get();
                      final snapshot_address = await ref.child(_number.text.toString()).child("Dprofile").child("Daddress").get();
                      final snapshot_nid = await ref.child(_number.text.toString()).child("Dprofile").child("Dnid").get();
                      final snapshot_nid_num = await ref.child(_number.text.toString()).child("Dprofile").child("Dnid_num").get();
                      final snapshot_gender = await ref.child(_number.text.toString()).child("Dprofile").child("DGender").get();
                      final snapshot_date_of_birth = await ref.child(_number.text.toString()).child("Dprofile").child("Ddate_of_birth").get();
                      final snapshot_v_type = await ref.child(_number.text.toString()).child("Dprofile").child("Vehicle_Type").get();
                      final snapshot_v_model = await ref.child(_number.text.toString()).child("Dprofile").child("Vehicle_Model").get();
                      final snapshot_v_num = await ref.child(_number.text.toString()).child("Dprofile").child("Vehicle_Registration_Number").get();
                      final snapshot_licence = await ref.child(_number.text.toString()).child("Dprofile").child("Driving_licence_Number").get();

                      if(snapshot_pass.exists){


                        if(snapshot_pass.value.toString()== _Passcontroller.text.toString()){


                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage(
                                    SearchDestination: '',
                                  phnNumber: _number.text.toString(),
                                  password: snapshot_pass.value.toString(),
                                  full_name: snapshot_name.value.toString(),
                                  address: snapshot_address.value.toString(),
                                  gender: snapshot_gender.value.toString(),
                                  vehicleType: snapshot_v_type.value.toString(),
                                  vehicleModel: snapshot_v_model.value.toString(),
                                  vehicleRegNum: snapshot_v_num.value.toString(),
                                  licenceNum: snapshot_licence.value.toString(),
                                  date_of_birth: snapshot_date_of_birth.value.toString(),
                                  nid: snapshot_nid.value.toString(),
                                  nid_number: snapshot_nid_num.value.toString(),
                                  );
                              },
                            ),
                          );

                          sharedPref(_number.text.toString(), snapshot_pass.value.toString(),
                              snapshot_name.value.toString(),snapshot_address.value.toString(),
                            snapshot_gender.value.toString(), snapshot_v_type.value.toString(),
                              snapshot_v_model.value.toString(),snapshot_v_num.value.toString(),snapshot_licence.value.toString(),
                          snapshot_date_of_birth.value.toString(),snapshot_nid.value.toString(),snapshot_nid_num.value.toString());


                        }
                        else{
                          Fluttertoast.showToast(
                              msg: "Wrong Information",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }

                      }
                      else{

                        Fluttertoast.showToast(
                            msg: "No Account found",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }





                    },
                    child: Text('Login',
                      style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                ),
              ),



              TextButton(
                 style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () async{

                },
                child: Text('FORGOT PASSWORD?',
                  style: TextStyle(fontSize: 16,color: Colors.black),),
              ),
              SizedBox(height: 6,),
              Container(
                height: 60,width: 320,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red.shade600,width: 1.0),
                    borderRadius: BorderRadius.circular(3)
                ),
                child:   TextButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () async{

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpForCar();
                        },
                      ),
                    );






                  },
                  child: Text('CREATE NEW ACCOUNT',
                    style: TextStyle(fontSize: 18,color: Colors.red.shade600),),
                ),
              ),
              //SizedBox(height: 10,),

              Container(
                height: 180,width: 400,
                  child: Image.asset("assets/RRoadLogin.png",))



            ],
          ),
        ),
      ),
    );
  }



  Future<void> sharedPref(String phnNumber , String password, String full_name, String address,
      String gender, String vehicleType, String vehicleModel, String vehicleRegNum, String licenceNum,
      String date_of_birth, String nid, String nid_number,
      ) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('phoneNumber', phnNumber);
    await prefs.setString('password', password);
    await prefs.setString('full_name', full_name);
    await prefs.setString('address', address);
    await prefs.setString('gender', gender);
    await prefs.setString('vehicleType', vehicleType);
    await prefs.setString('vehicleModel', vehicleModel);
    await prefs.setString('vehicleRegNum', vehicleRegNum);
    await prefs.setString('licenceNum', licenceNum);
    await prefs.setString('date_of_birth', date_of_birth);
    await prefs.setString('nid', nid);
    await prefs.setString('nid_number', nid_number);


    //await prefs.setString('action', 'Start');



  }


  Future<void> Perm() async {





// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
    ].request();
    print(statuses[Permission.location]);


    // if (await Permission.contacts.request().isGranted) {
    // // Either the permission was already granted before or the user just granted it.
    // }

// You can request multiple permissions at once.

   // print(statuses[Permission.location]);



  }





}
