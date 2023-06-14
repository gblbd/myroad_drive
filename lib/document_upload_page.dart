

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class DocumentUploadPage extends StatefulWidget{

  @override
  State<DocumentUploadPage> createState() => _DocumentUploadPageState();
}

class _DocumentUploadPageState extends State<DocumentUploadPage> {
   List<String> list = <String>['Select Document name','Driving Licence', 'NID Front side', 'NID back side', 'Vehicle Registration Paper','Vehicle fitness Certificate','Vehicle tax Token'];

   String dropdownValue = 'Select Document name';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Files"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [




              Image.asset(
                "assets/icon1.gif",
                height: 30.h,
                width: 100.w,
              ),

              SizedBox(
                height: 60,
              ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Document Name : ",

                        style: GoogleFonts.openSans(
                          fontSize: 21,
                          fontWeight: FontWeight.bold
                        ),

                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(
                        fontSize: 21,
                          color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
          ),
                    ],
                  ),
                ],
              ),
            ),


              SizedBox(
                height: 30,
              ),


              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(300, 40), //////// HERE
                  ),


                  onPressed: () async {


                PermissionStatus permission_result;
                permission_result=await Permission.storage.request();

                FilePickerResult? result = await FilePicker.platform.pickFiles();

                if (result != null) {
                  File file = File(result.files.single.path!);
                } else {
                  // User canceled the picker
                }

              }, child: Text("Choose a file",

                style: GoogleFonts.openSans(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
                ),

              )),

              SizedBox(height: 21,),


              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(300, 40), //////// HERE
                  ),


                  onPressed: () async {


                    // PermissionStatus permission_result;
                    // permission_result=await Permission.storage.request();
                    //
                    // FilePickerResult? result = await FilePicker.platform.pickFiles();
                    //
                    // if (result != null) {
                    //   File file = File(result.files.single.path!);
                    // } else {
                    //   // User canceled the picker
                    // }

                  }, child: Text("Upload the file",

                style: GoogleFonts.openSans(
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                ),

              )),



            ],
          ),
        ),
      ),
    );
  }
}