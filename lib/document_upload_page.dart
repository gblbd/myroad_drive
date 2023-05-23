

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text("Document Name : ",

                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),

                ),
                DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
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
          ),



            ElevatedButton(onPressed: (){}, child: Text("Choose a file")),




          ],
        ),
      ),
    );
  }
}