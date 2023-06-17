


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget{

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<String> listLanguage = <String>['English','Bangla'];

  String dropdownValueLanguage = 'English';

  List<String> listGender = <String>['Male','Female','Other'];

  String dropdownValueGender = 'Male';


  TextEditingController fullnameUp=TextEditingController();
  TextEditingController phoneNumUp=TextEditingController();
  TextEditingController addressUp=TextEditingController();
  TextEditingController dateOfBirthUp=TextEditingController();
  TextEditingController genderUp=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Container(
        child: Column(
          children: [

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
                 // controller: _controller,
                  //maxLength: 11,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Update Name",
                    labelStyle: TextStyle(color: Colors.grey),
                    // counterText: '$_characterCount / 11',
                  ),

                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red,
                  //onChanged: (input) => _validatePhoneNumber(input),
                ),
              ),
            ),

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
                  //controller: _controller,
                  //maxLength: 11,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Update driving Licence No",
                    labelStyle: TextStyle(color: Colors.grey),
                    // counterText: '$_characterCount / 11',
                  ),

                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red,
                  //onChanged: (input) => _validatePhoneNumber(input),
                ),
              ),
            ),

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
                  //controller: _controller,
                 // maxLength: 11,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Update vehicle registration No.",
                    labelStyle: TextStyle(color: Colors.grey),
                    // counterText: '$_characterCount / 11',
                  ),

                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red,
                  //onChanged: (input) => _validatePhoneNumber(input),
                ),
              ),
            ),


            Divider(
              thickness: 1,
            ),

            ListTile(
              title: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Language : ",

                      style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),

                    ),
                    DropdownButton<String>(
                      value: dropdownValueLanguage,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValueLanguage = value!;
                        });
                      },
                      items: listLanguage.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),

            Divider(
              thickness: 1,
            ),



            ListTile(
              title: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Gender : ",

                      style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),

                    ),
                    DropdownButton<String>(
                      value: dropdownValueGender,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValueGender = value!;
                        });
                      },
                      items: listGender.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),

            Divider(
              thickness: 1,
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

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return HomePage(SearchDestination: '',);
                    //     },
                    //   ),
                    // );


                  },
                  child: Text('Save Update',
                    style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}