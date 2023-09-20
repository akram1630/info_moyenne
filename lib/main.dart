import 'package:flutter/material.dart';

import 'Moyenne_Calculatrice/homePage.dart';



void main(){
  //runApp(MyApp());
  MyApp appRev = MyApp();
  runApp(appRev);
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: moyCalculScreen(),
    );
  }
}