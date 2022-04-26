import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizstar/splash.dart';
import 'package:device_preview/device_preview.dart';
void main() => runApp(
DevicePreview(
enabled: true,
builder: (context) =>
MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "Cùng UTT ôn thi THPT quốc gia",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: splashscreen(),
    );
  }
}