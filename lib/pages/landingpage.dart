import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/pages/loginpage.dart';
import 'package:tasklist/pages/taskspage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 70, 8, 12),
        child: Column(
          children: [
            Image.asset("assets/images/taskHeroImg.jpg"),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 40.0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Welcome to ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                  ),
                  Text(
                    "Strakins ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 27, 133, 151),
                      fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "App",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Monitor your tasks realtime with our apps",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: SizedBox(
                  width: 320,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 18, 156, 180))),
                    onPressed: () {
                      Get.to(() => TasksPage());
                    },
                    child: const Text(
                      "Click here to Proceed",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
              child: Row(
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.to(() => LoginPage());
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Color.fromARGB(255, 18, 156, 180)),
                    ),
                    style: OutlinedButton.styleFrom(side: BorderSide.none),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
