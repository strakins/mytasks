import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/pages/generalpage.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daily Task Checklist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: LandingPageNavs(),
      debugShowCheckedModeBanner: false,
    );
  }
}