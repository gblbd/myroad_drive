
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';


import 'WelcomeScreen.dart';

 main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  final Future<FirebaseApp> F_App= Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.red,
        ),
        home: WelcomeScreen(),
      );
    });


  }
}
