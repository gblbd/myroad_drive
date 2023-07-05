import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:myroad_drive/LoginScreen.dart';
import 'package:myroad_drive/home_page.dart';
import 'package:myroad_drive/permission_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
   WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String phoneNumber='';

  String password='';

  String full_name='';

  String address='';

  String gender='';

  String vehicleType='';

  String vehicleModel='';

  String vehicleRegNum='';

  String licenceNum='';

  String date_of_birth='';

  String nid='';

  String nid_number='';

  bool islogged=false;

  @override
  Widget build(BuildContext context) {

    check();





    return AnimatedSplashScreen(
      duration: 3000,
      splash: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 310,
                  height: 120,
                  child: Image.asset('assets/MyRoadDriveLogo.png',height: 120,width: 300,),
                ),
              ],
            ),
          ],
        ),
      ),
      nextScreen: islogged==true? HomePage(SearchDestination: '', phnNumber: phoneNumber, password: password, full_name: full_name, address: address, gender: gender, vehicleType: vehicleType, vehicleModel: vehicleModel, vehicleRegNum: vehicleRegNum, licenceNum: licenceNum, date_of_birth: date_of_birth, nid: nid, nid_number: nid_number): LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: double.maxFinite,
      backgroundColor:  Color(0xFFFFF8F8),
    );
  }

  Future<void> check() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("phoneNumber")&&prefs.containsKey("password")) {


      phoneNumber= (await prefs.getString('phoneNumber'))!;
      password= (await prefs.getString('password'))!;
      full_name= (await prefs.getString('full_name'))!;
      address=(await prefs.getString('address'))!;
      gender=(await prefs.getString('gender'))!;
      vehicleType=(await prefs.getString('vehicleType'))!;
      vehicleModel=(await prefs.getString('vehicleModel'))!;
      vehicleRegNum=(await prefs.getString('vehicleRegNum'))!;
      licenceNum=(await prefs.getString('licenceNum'))!;
      date_of_birth=(await prefs.getString('date_of_birth'))!;
      nid=(await prefs.getString('nid'))!;
      nid_number=(await prefs.getString('nid_number'))!;

      islogged=true;







    }

    else{

      islogged=true;

    }



  }
  @override
  void initState() {

    check();
    // TODO: implement initState
    super.initState();
  }


}
