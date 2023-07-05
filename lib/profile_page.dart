

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myroad_drive/edit_profile.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart' as path;
import 'package:url_launcher/url_launcher.dart';


class ProfilePage extends StatefulWidget {
  final String DfullName;
  final String DphoneNum;
  final String Daddress;
  final String DdateOfBirth;
  final String Dgender;
  final String DnidNum;
  final String DvehicleType;
  final String DvehicleModel;
  final String DvehicleRegNum;
  final String DdrivingLicenceNum;
  // const ProfilePage({super.key});
  const ProfilePage({Key? key, required this.DfullName, required this.DphoneNum, required this.Daddress, required this.DdateOfBirth, required this.Dgender, required this.DnidNum, required this.DvehicleType, required this.DvehicleModel, required this.DvehicleRegNum, required this.DdrivingLicenceNum}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseStorage storage = FirebaseStorage.instance;

  //upload to firebase storage picture

  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 1920);

      //final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage!.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref().child('Images').child('/profile_pic.jpg').putFile(
            imageFile,
            SettableMetadata(
                contentType: 'image/jpeg',
                customMetadata: {'picked-image-path': imageFile.path}));

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextButton(
              //     onPressed: (){
              //       _upload('gallery');
              //     },
              //     child:  Text("Upload Image", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                width: 100.w,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.red.shade50
                ),
                child: ListTile(

                  leading: Container(

                    width: 25.w,
                    height: 18.h,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: Icon(Icons.person,color: Colors.blueGrey,),
                    ),
                  ),
                  title: Text("Name: ${widget.DfullName}",

                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),

                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone Number: ${widget.DphoneNum}"),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.star,
                            color: Colors.amberAccent.shade700,

                          ),
                          Text(" 4.6",

                            style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),

                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),






              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address",
                            style: GoogleFonts.openSans(
                                fontSize: 16,fontWeight: FontWeight.w600
                            ),
                          ),
                          Text("${widget.Daddress}",
                            style: GoogleFonts.openSans(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Date Of Birth",
                                style: GoogleFonts.openSans(
                                    fontSize: 16,fontWeight: FontWeight.w600
                                ),
                              ),
                              Text("${widget.DdateOfBirth}",
                                style: GoogleFonts.openSans(
                                    fontSize: 14,fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Gender",
                                style: GoogleFonts.openSans(
                                    fontSize: 16,fontWeight: FontWeight.w600
                                ),
                              ),
                              Text("${widget.Dgender}",
                                style: GoogleFonts.openSans(
                                    fontSize: 14,fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 20,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("NID Number",
                            style: GoogleFonts.openSans(
                                fontSize: 16,fontWeight: FontWeight.w600
                            ),
                          ),
                          Text("${widget.DnidNum}",
                            style: GoogleFonts.openSans(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Vehicle Type",
                                style: GoogleFonts.openSans(
                                    fontSize: 16,fontWeight: FontWeight.w600
                                ),
                              ),
                              Text("${widget.DvehicleType}",
                                style: GoogleFonts.openSans(
                                    fontSize: 14,fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Vehicle Model",
                                style: GoogleFonts.openSans(
                                    fontSize: 16,fontWeight: FontWeight.w600
                                ),
                              ),
                              Text("${widget.DvehicleModel}",
                                style: GoogleFonts.openSans(
                                    fontSize: 14,fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("Vehicle Registration Number",
                            style: GoogleFonts.openSans(
                                fontSize: 16,fontWeight: FontWeight.w600
                            ),
                          ),
                          Text("${widget.DvehicleRegNum}",
                            style: GoogleFonts.openSans(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 20,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("Driving Licence Number",
                            style: GoogleFonts.openSans(
                                fontSize: 16,fontWeight: FontWeight.w600
                            ),
                          ),
                          Text("${widget.DdrivingLicenceNum}",
                            style: GoogleFonts.openSans(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        thickness: 1,
                      ),

                      ListTile(

                        onTap: (){},
                        title: Text("Change password",

                          style: GoogleFonts.openSans(
                              fontSize: 20
                          ),

                        ),
                      ),

                      Divider(
                        thickness: 1,
                      ),

                      ListTile(

                        onTap: () async {

                          await launchUrl(Uri.parse('https://gorgeousbangladeshltd.netlify.app/dirverPrivacyPolicy'));


                        },
                        title: Text("Privacy Policy",

                          style: GoogleFonts.openSans(
                              fontSize: 20
                          ),

                        ),
                      ),

                      Divider(
                        thickness: 1,
                      ),




                    ],
                  ),
                ),
              )














            ],
          ),
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EditProfile()
                )
            );

          },
          label: Text("Edit"),
          hoverElevation: 100,
          icon: Icon(Icons.edit),
          splashColor: Colors.purple,

          backgroundColor: Colors.pink.shade500,
        ),
      ),



    );
  }

}