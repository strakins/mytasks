
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/components/taskwidget_card.dart';
import 'package:tasklist/controllers/task_controller.dart';

class TasksPage extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 27, 133, 151),
        appBar: AppBar(
          title: const Text(
            "Hello, Strakins 👋",
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 13, 200, 241),
          onPressed: controller.createTask,
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Obx(() => buildStatCard(
                    "Total Tasks",
                    controller.taskList.length,
                    Colors.blue,
                  )),
                ),
                Expanded(
                  child: Obx(() => buildStatCard(
                    "Completed Tasks",
                    controller.taskList.where((task) => task['completed']).length,
                    const Color.fromARGB(255, 235, 125, 117),
                  )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                "Available Tasks",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.taskList.length,
                itemBuilder: (context, index) {
                  return TaskCard(index: index);
                },
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatCard(String title, int value, Color color) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$value',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
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
    home: TasksPage(),
  ));
}
