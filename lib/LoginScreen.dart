
import 'package:flutter/material.dart';
import 'package:myroad_drive/home_page.dart';

import 'CreateAccount.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _number = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    controller: _controller,
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter Your Password",
                      labelStyle: TextStyle(color: Colors.grey)
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

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage(SearchDestination: '',);
                          },
                        ),
                      );


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
                          return CreateAccount();
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
}
