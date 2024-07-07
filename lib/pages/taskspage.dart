import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/controllers/task_controller.dart';
import 'package:tasklist/components/taskwidget_card.dart';
import 'package:tasklist/pages/taskdetailspage.dart';

class TasksPage extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();

  void createTask() {
    Get.defaultDialog(
      title: "Create Task",
      content: Column(
        children: [
          TextField(
            controller: _controllerTitle,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Task Title",
            ),
          ),
          TextField(
            controller: _controllerDescription,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Task Description",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  taskController.saveTask(
                    _controllerTitle.text,
                    _controllerDescription.text,
                  );
                  _controllerTitle.clear();
                  _controllerDescription.clear();
                  Get.back();
                },
                child: const Text("Create"),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  _controllerTitle.clear();
                  _controllerDescription.clear();
                  Get.back();
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void updateTask(int index) {
    _controllerTitle.text = taskController.taskList[index].title;
    _controllerDescription.text = taskController.taskList[index].description;
    Get.defaultDialog(
      title: "Update Task",
      content: Column(
        children: [
          TextField(
            controller: _controllerTitle,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Task Title",
            ),
          ),
          TextField(
            controller: _controllerDescription,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Task Description",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  taskController.updateTask(
                    index,
                    _controllerTitle.text,
                    _controllerDescription.text,
                  );
                  _controllerTitle.clear();
                  _controllerDescription.clear();
                  Get.back();
                },
                child: const Text("Update"),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  _controllerTitle.clear();
                  _controllerDescription.clear();
                  Get.back();
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 27, 133, 151),
        appBar: AppBar(
          title: const Text(
            "Hello, Strakins 👋",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
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
          onPressed: createTask,
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Obx(() => buildStatCard(
                      "Total Tasks", taskController.totalTasks, Colors.blue)),
                ),
                Expanded(
                  child: Obx(() => buildStatCard("Completed Tasks",
                      taskController.completedTasks, Colors.red)),
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
              child: Obx(
                () => ListView.builder(
                  itemCount: taskController.taskList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(TaskDetailPage(task: taskController.taskList[index]));
                      },
                      child: TaskCard(
                        taskName: taskController.taskList[index].title,
                        taskCompleted: taskController.taskList[index].isCompleted,
                        onChanged: (value) =>
                            taskController.taskCompleted(value, index),
                        onDelete: (context) =>
                            taskController.deleteTask(index),
                        onEdit: (context) => updateTask(index),
                      ),
                    );
                  },
                ),
              ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
