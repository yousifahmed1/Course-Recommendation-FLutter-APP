import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),);
  }

}


  child: ColorFiltered(
    colorFilter: ColorFilter.mode(
      Colors.black.withOpacity(0.2), // Change the opacity value as needed
      BlendMode.srcOver,
    ),