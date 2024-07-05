import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Profile",
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: const <Widget>[
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
          opacity: 10.0,
        ),
        backgroundColor: const Color.fromARGB(255, 28, 95, 107),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_pics.png'),
              ),
            ),
            SizedBox(height: 20),
            Obx(() => Text(
              controller.name.value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(height: 8),
            Obx(() => Text(
              controller.email.value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            )),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Obx(() => Text(controller.phone.value)),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Address'),
              subtitle: Obx(() => Text(controller.address.value)),
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Birthday'),
              subtitle: Obx(() => Text(controller.birthday.value)),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: controller.editProfile,
              icon: Icon(Icons.edit),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
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
  runApp(GetMaterialApp(
    home: ProfilePage(),
  ));
}
