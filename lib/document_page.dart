

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myroad_drive/document_upload_page.dart';

class DocumentPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [

          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
              itemBuilder:(context,index){

                return ListTile(
                  title: Text("Document Name"),
                  subtitle: Text("Uploaded at : "),
                );

              }),

        ],
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
                        DocumentUploadPage()
                )
            );

          },
          label: Text("Add Document"),
          hoverElevation: 100,
          icon: Icon(Icons.note_add_outlined),
          splashColor: Colors.purple,

          backgroundColor: Colors.pink.shade500,
        ),
      ),



    );
  }




}