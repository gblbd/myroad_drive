import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:myroad_drive/LoginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: double.maxFinite,
      backgroundColor:  Color(0xFFFFF8F8),
    );
  }
}
