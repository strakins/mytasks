import 'package:flutter/material.dart';
import 'package:tasklist/pages/generalpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Media',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPageNavs(),
      debugShowCheckedModeBanner: false,
    );
  }
}

