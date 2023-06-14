import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

import 'LoginScreen.dart';
import 'WelcomeScreen.dart';


class SignUpForCar extends StatefulWidget {
  const SignUpForCar({Key? key}) : super(key: key);

  @override
  State<SignUpForCar> createState() => _SignUpForCarState();
}

class _SignUpForCarState extends State<SignUpForCar> {


  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("Driver_profile");



  final TextEditingController _fullName=TextEditingController();
  final TextEditingController _address=TextEditingController();
  final TextEditingController _Nid=TextEditingController();
  final TextEditingController _Passport=TextEditingController();
  final TextEditingController _DOB=TextEditingController();
  final TextEditingController Driving_LicenseNUmber=TextEditingController();
  final TextEditingController Vehicle_registrationNum=TextEditingController();


  List<String> list_gender = <String>['Male', 'Female','Other'];
  String dropdownValue_gender = 'Male';

  List<String> list_auth = <String>['NID', 'Passport'];
  String dropdownValue_auth = 'NID';

  List<String> list_Car = <String>['Select Vehicle Model', 'Daihstsu','Ford','Honda','Hyundai','Maruti Suzuki','Mazda','Mitsubishi','Nissan','Tata','Toyota',];
  String dropdownValue_Car = 'Select Vehicle Model';//vehicle_Type



  List<String> vehicle_Type = <String>['Select Vehicle type', 'Car','Bike','CNG'];
  String dropdownValue_vehicle_Type = 'Select Vehicle type';//vehicle_Type





  List<String> list_Model = <String>['Select Model', 'Accent','Elantra','Sonata'];
  String dropdownValue_Model = 'Select Model';


  // List<String> list_carNum = <String>['BH', 'DHK METRO','CTG METRO','SYL METRO','KHL Metro','BN','BR','BA','BH','BO','BB','CH','CN','CD','CM','CB','DH',];
  // String dropdownValue_carNum = 'BH';

  void _onManufacturerTypeChanged(String? value) {
    setState(() {
      dropdownValue_Car = value!;
    });
  }


  void _vehicleTypeChange(String? value) {
    setState(() {
      dropdownValue_vehicle_Type = value!;
    });
  }
  // void _onCarNumTypeChanged(String? value) {
  //   setState(() {
  //     dropdownValue_carNum = value!;
  //   });
  // }

  DateTime selectedDate = DateTime.now();
  @override
  void initState(){
    _DOB.text="";
    super.initState();
  }
  void _onIDTypeChanged(String? value) {
    setState(() {
      dropdownValue_auth = value!;
    });
  }
  final TextEditingController phoneNumbController=TextEditingController();
  final TextEditingController _password=TextEditingController();
  // void _validatePhoneNumber() {
  //   setState(() {
  //     _isPhoneNumberValid = phoneNumbController.text.isNotEmpty && phoneNumbController.text.length==10;
  //   });
  // }

  @override
  void dispose() {
    phoneNumbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up for Car',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 35,width: 400,
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('PERSONAL INFORMATION',
                      style: TextStyle(color: Colors.black,fontSize: 16),

                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Take your photo',
                  style: TextStyle(color: Colors.black,fontSize: 14),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red.shade50,
                    radius: 60,
                    child: GestureDetector(
                      onTap: (){},
                        child: Icon(Icons.camera_alt_outlined,color: Colors.red,size: 50,)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                child: Text('Enter your mobile number',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
                child: IntlPhoneField(
                  controller: phoneNumbController,
                  decoration: InputDecoration(
                    hintText: '1XXXXXXXXX',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                  ),
                  initialCountryCode: 'BD',
                  keyboardType: TextInputType.phone,
                  //onChanged: (_)=>_validatePhoneNumber(),
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                     // border: InputBorder.none,
                      labelText: "Enter Your Password",
                      labelStyle: TextStyle(color: Colors.grey)
                  ),
                  cursorColor: Colors.red,

                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 0),
                child: TextFormField(
                  controller: _fullName,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Full Name (Same as NID/License)*',
                    //labelStyle: TextStyle(color: )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: TextFormField(
                  controller: _address,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Address (Full Address)*',
                    //labelStyle: TextStyle(color: )
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(left: 16,right: 8),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 25.w,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey)
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                         // alignedDropdown: true,
                          child: DropdownButton<String>(

                            value: dropdownValue_auth,
                            icon: const Icon(Icons.arrow_drop_down,size: 20,),
                            //elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            onChanged: _onIDTypeChanged,
                            items: list_auth.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                  style:TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              );
                            }).toList(),
                          ),

                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 58.w,
                        child: dropdownValue_auth =='NID' ? TextFormField(
                          controller: _Nid,
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'NID Number*',
                            //labelStyle: TextStyle(color: )
                          ),
                        ):TextFormField(
                          controller: _Passport,
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'Passport Number*',
                            //labelStyle: TextStyle(color: )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),





              Padding(
                padding: const EdgeInsets.only(left: 16,right: 8),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 25.w,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey)
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          // alignedDropdown: true,
                          child: DropdownButton<String>(

                            value: dropdownValue_gender,
                            icon: const Icon(Icons.arrow_drop_down,size: 20,),
                            //elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? value) {
                              setState(() {
                                dropdownValue_gender = value!;
                              });
                            },
                            items: list_gender.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                  style:TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 58.3.w,
                        child: TextFormField(
                          controller: _DOB,
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                          ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2025)
                              );
                              if (pickedDate != null) {

                                String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate).toString();
                                setState(() {
                                  _DOB.text = formattedDate;
                                });
                              }
                            }
                        ),
                        ),
                      ),

                  ],
                ),
              ),















              Container(
                  height: 35,width: 400,
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Vehicle INFORMATION*',
                      style: TextStyle(color: Colors.black,fontSize: 16),

                    ),
                  )
              ),






              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 380,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey)
                      )
                  ),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      child: DropdownButton<String>(
                        value: dropdownValue_vehicle_Type,
                        icon: const Icon(Icons.arrow_drop_down,size: 20,),
                        //elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: _vehicleTypeChange,
                        //     (String? value) {
                        //   setState(() {
                        //     dropdownValue_Car = value!;
                        //   });
                        // },
                        items: vehicle_Type.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                              style:TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),






              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 380,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey)
                    )
                  ),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      child: DropdownButton<String>(
                        value: dropdownValue_Car,
                        icon: const Icon(Icons.arrow_drop_down,size: 20,),
                        //elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: _onManufacturerTypeChanged,
                        //     (String? value) {
                        //   setState(() {
                        //     dropdownValue_Car = value!;
                        //   });
                        // },
                        items: list_Car.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                              style:TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                child: TextFormField(
                  controller: Vehicle_registrationNum,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Vehicle registration Number*',
                    //labelStyle: TextStyle(color: )
                  ),
                ),
              ),


              // ['Select Manufacturer', 'Daihstsu','Ford','Honda','Hyundai','Maruti Suzuki','Mazda','Mitsubishi','Nissan','Tata','Toyota',].contains(_onManufacturerTypeChanged)
          //     //_onManufacturerTypeChanged == 'Daihstsu'
          //         ? Container(
          //       height: 60,
          //       width: 110,
          //       decoration: BoxDecoration(
          //         border: Border(
          //             bottom: BorderSide(color: Colors.grey)
          //         ),
          //       ),
          //       child: DropdownButtonHideUnderline(
          //         child: ButtonTheme(
          //           // alignedDropdown: true,
          //           child: DropdownButton<String>(
          //
          //             value: dropdownValue_Model,
          //             icon: const Icon(Icons.arrow_drop_down,size: 20,),
          //             //elevation: 16,
          //             style: const TextStyle(color: Colors.black),
          //             onChanged: _onModelTypeChanged,
          //             items: list_Model.map<DropdownMenuItem<String>>((String value) {
          //               return DropdownMenuItem<String>(
          //                 value: value,
          //                 child: Text(value,
          //                   style:TextStyle(
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.w400
          //                   ),
          //                 ),
          //               );
          //             }).toList(),
          //           ),
          //
          //         ),
          //       ),
          //     ) : SizedBox(child: Text('problem'),),
          //
          //     //||'Ford'||'Honda'||'Hyundai'||'Maruti Suzuki'||'Mazda'||'Mitsubishi'||'Nissan'||'Tata'||'Toyota' ?




              Container(
                  height: 35,width: 400,
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Driver\'s Informations*',
                      style: TextStyle(color: Colors.black,fontSize: 16),

                    ),
                  )
              ),




              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                child: TextFormField(
                  controller: Driving_LicenseNUmber,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Enter Driving Licence Number*',
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Container(
              //     height: 60,
              //     width: 110,
              //     decoration: BoxDecoration(
              //       border: Border(
              //           bottom: BorderSide(color: Colors.grey)
              //       ),
              //     ),
              //     child: DropdownButtonHideUnderline(
              //       child: ButtonTheme(
              //         // alignedDropdown: true,
              //         child: DropdownButton<String>(
              //
              //           value: dropdownValue_carNum.isNotEmpty ? dropdownValue_carNum : null,
              //           icon: const Icon(Icons.arrow_drop_down,size: 20,),
              //           //elevation: 16,
              //           style: const TextStyle(color: Colors.black),
              //           onChanged: _onCarNumTypeChanged,
              //           items: list_carNum.map<DropdownMenuItem<String>>((String value) {
              //             return DropdownMenuItem<String>(
              //               value: value,
              //               child: Text(value,
              //                 style:TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w400
              //                 ),
              //               ),
              //             );
              //           }).toList(),
              //         ),
              //
              //       ),
              //     ),
              //   ),
              // ),
              RichText(text: TextSpan(
                text: 'by signing up you are agree to terms and condition.',
                style: TextStyle(color: Colors.black)
              )),
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
                      await ref.child("0${phoneNumbController.text.toString()}").child("Dprofile").set({
                        "Dphone_Number": "0${phoneNumbController.text.toString()}",
                        "Password":"${_password.text.toString()}",
                        "Dfull_Name":"${_fullName.text.toString()}",
                        "Daddress":"${_address.text.toString()}",
                        "Dpassport":"${dropdownValue_auth.toString()}",
                        "Dpassport_num":"${_password.text.toString()}",
                        "DGender":"${dropdownValue_gender.toString()}",
                        "Ddate_of_birth":"${_DOB.text.toString()}",
                        "Vehicle_Type":"${dropdownValue_Car.toString()}",
                        "Vehicle_Model":"${dropdownValue_Model.toString()}",
                        "Vehicle_Registration_Number": "${Vehicle_registrationNum.text.toString()}",
                        "Driving_licence_Number":"${Driving_LicenseNUmber.text.toString()}"
                      }).then((value) {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      });



                    },
                    child: Text('AGREE & SIGNUP',
                      style: TextStyle(fontSize: 20,color: Colors.white),),
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
