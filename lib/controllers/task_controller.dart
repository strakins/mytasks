// task_controller.dart
import 'package:get/get.dart';
import 'package:tasklist/models/task_model.dart';


class TaskController extends GetxController {
  var taskList = <Task>[].obs;

  TaskController() {
    taskList.addAll([
      Task(title: "Visit the Mall", description: "Purchase Groceries", creationDate: DateTime.parse("2022-04-22"), isCompleted: false),
      Task(title: "Complete KodeCamp Task 3", description: "Task 4 Essentials", creationDate: DateTime.parse("2024-04-12"), isCompleted: true),
      Task(title: "Go for driving class", description: "Makes it easier", creationDate: DateTime.parse("2024-05-02"), isCompleted: true),
    ]);
  }

  int get totalTasks => taskList.length;
  int get completedTasks => taskList.where((task) => task.isCompleted).length;

  void addTask(Task task) {
    taskList.add(task);
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
  }

  void updateTask(int index, Task updatedTask) {
    taskList[index] = updatedTask;
  }

  void toggleTaskCompletion(int index) {
    var task = taskList[index];
    task.isCompleted = !task.isCompleted;
    taskList[index] = task;
  }
}



// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:tasklist/models/task_model.dart';

// class TaskController extends GetxController {
//   var taskList = <Task>[].obs;
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   int get totalTasks => taskList.length;
//   int get completedTasks => taskList.where((task) => task.isCompleted).length;

//   void addTask(String title, String description) {
//     taskList.add(Task(
//       title: title,
//       description: description,
//       creationDate: DateTime.now(),
//     ));
//     clearControllers();
//   }

//   void deleteTask(int index) {
//     taskList.removeAt(index);
//   }

//   void updateTask(int index, String title, String description) {
//     var task = taskList[index];
//     task.title = title;
//     task.description = description;
//     taskList[index] = task;
//     clearControllers();
//   }

//   void toggleTaskCompleted(int index) {
//     var task = taskList[index];
//     task.isCompleted = !task.isCompleted;
//     taskList[index] = task;
//   }

//   void clearControllers() {
//     titleController.clear();
//     descriptionController.clear();
//   }
// }
