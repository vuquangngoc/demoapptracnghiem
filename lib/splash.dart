import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizstar/home.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
// import 'package:device_preview/device_preview.dart';
class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 6), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homepage(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      // body: Center(
        body: Container(
        child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Image.asset('assets/logo.png', width: 200,height: 160),
          //  CircleAvatar(
          //   backgroundImage: ExactAssetImage('assets/logo.png'),
          //   minRadius: 45,
          //   maxRadius: 75,
          // ),
          SizedBox(width: 20, height: 20),

          const Text(
          "Cùng UTT ôn thi THPT quốc gia !!",
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.white,
            fontFamily: "Satisfy",
          ),
          textAlign: TextAlign.center,
        ),
      ]),
    )));
  }
}