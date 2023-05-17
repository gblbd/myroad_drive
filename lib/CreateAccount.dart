import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'OTP_page.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

 final TextEditingController phoneNumbController=TextEditingController();
  bool _isPhoneNumberValid = false;



  void _validatePhoneNumber() {
    setState(() {
      _isPhoneNumberValid = phoneNumbController.text.isNotEmpty && phoneNumbController.text.length==10;
    });
  }

  @override
  void dispose() {
    phoneNumbController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
            padding: const EdgeInsets.all(16.0),
            child: IntlPhoneField(
              controller: phoneNumbController,
              decoration: InputDecoration(
                //   labelText: 'Phone Number',
                hintText: '1XXXXXXXXX',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black12
                  ),
                ),
              ),
              initialCountryCode: 'BD',
              keyboardType: TextInputType.phone,
              onChanged: (_)=>_validatePhoneNumber(),
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
            ),
          ),

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
                        return SignUpPage();
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
    );
  }
}
