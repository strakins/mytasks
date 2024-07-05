import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/components/dialogue_widget.dart';

class TaskController extends GetxController {
  var taskList = <Map<String, dynamic>>[
    {"name": "Visit the Mall", "completed": false}.obs,
    {"name": "Complete KodeCamp Task 3", "completed": true}.obs,
    {"name": "Go for driving class", "completed": false}.obs,
  ].obs;

  final TextEditingController controller = TextEditingController();

  void taskCompleted(int index) {
    taskList[index]['completed'] = !taskList[index]['completed'];
    update();
  }

  void saveTask() {
    taskList.add({"name": controller.text, "completed": false});
    controller.clear();
    update();
    Get.back();
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
  }

  void updateTask(int index) {
    controller.text = taskList[index]['name'];
    Get.dialog(DialogWidget(
      controller: controller,
      onSave: () {
        taskList[index]['name'] = controller.text;
        controller.clear();
        Get.back();
      },
      onCancel: () {
        controller.clear();
        Get.back();
      },
    ));
  }

  void createTask() {
    Get.dialog(DialogWidget(
      controller: controller,
      onSave: saveTask,
      onCancel: () {
        Get.back();
      },
    ));
  }
}
