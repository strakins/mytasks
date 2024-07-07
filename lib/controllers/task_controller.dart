import 'package:get/get.dart';
import 'package:tasklist/models/task_model.dart';

class TaskController extends GetxController {
  var taskList = <Task>[
    Task(title: "Visit the Mall", description: "Purchase Groceries", creationDate: DateTime.parse("2022-04-22"), isCompleted: false),
    Task(title: "Complete KodeCamp Task 3", description: "Task 4 Essentials", creationDate: DateTime.parse("2024-04-12"), isCompleted: true),
    Task(title: "Go for driving class", description: "Makes it easier", creationDate: DateTime.parse("2024-05-02"), isCompleted: true),
  ].obs;

  int get totalTasks => taskList.length;
  int get completedTasks => taskList.where((task) => task.isCompleted).length;

  void saveTask(String title, String description) {
    var newTask = Task(
      title: title,
      description: description,
      creationDate: DateTime.now(),
    );
    taskList.add(newTask);
  }

  void updateTask(int index, String title, String description) {
    taskList[index].title = title;
    taskList[index].description = description;
    taskList.refresh();
  }

  void taskCompleted(bool? value, int index) {
    taskList[index].isCompleted = value ?? false;
    taskList.refresh();
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
  }
}


