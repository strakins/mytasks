import 'package:flutter/material.dart';
import 'package:tasklist/pages/profilepage.dart';
import 'package:tasklist/pages/taskspage.dart';
import 'package:tasklist/pages/landingpage.dart';

class LandingPageNavs extends StatefulWidget {
  const LandingPageNavs({Key? key}) : super(key: key);

  @override
  _LandingPageNavsState createState() =>
      _LandingPageNavsState();
}

class _LandingPageNavsState extends State {
  int _selectedTab = 0;

  final List _pages =  [
    Center(
      child: LandingPage(),
    ),
    Center(
      child: TasksPage(),
    ),
    Center(
      child: ProfilePage(),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: "Home", 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list), 
            label: "Tasks"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}