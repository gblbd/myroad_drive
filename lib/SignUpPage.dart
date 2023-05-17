import 'package:flutter/material.dart';
import 'package:myroad_drive/SignUpPageForVehicle.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            Text('Select City',
              style: TextStyle(color: Colors.black,
              fontSize: 20,
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(title: Text('Dhaka',style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.white,),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpPageForVehicle();
                      },
                    ),
                  );
                },
                tileColor: Colors.red,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(title: Text('Chittagong',
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
              child: ListTile(title: Text('Sylhet',
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
              child: ListTile(title: Text('Khulna',
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
