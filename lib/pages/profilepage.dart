import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: const Text(
            "User Profile",
            style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          actions: const <Widget> [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Icon(Icons.notifications),
            ),
          ],
          actionsIconTheme: const IconThemeData(
            size: 25.0,
            color: Colors.white,
            opacity: 10.0
          ),
          backgroundColor: const Color.fromARGB(255, 28, 95, 107),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_pics.png'), // Add your profile image in the assets folder
              ),
            ),
            SizedBox(height: 20),
            // Name
            Text(
              'Strakins Blessing',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Email
            Text(
              'strakins.b@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            // Additional Info
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+234 456 7890'),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Address'),
              subtitle: Text('123 Main Street, Osogbo'),
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Birthday'),
              subtitle: Text('January 1, 1980'),
            ),
            Spacer(),
            // Edit Button
            ElevatedButton.icon(
              onPressed: () {
                // Implement edit functionality here
              },
              icon: Icon(Icons.edit),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                // primary: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
