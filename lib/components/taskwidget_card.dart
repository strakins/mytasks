import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:tasklist/controllers/task_controller.dart';

class TaskCard extends StatelessWidget {
  final int index;

  TaskCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => controller.deleteTask(index),
              icon: Icons.delete_forever_outlined,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8.0),
            ),
            SlidableAction(
              onPressed: (context) => controller.updateTask(index),
              icon: Icons.edit,
              backgroundColor: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            leading: Obx(() => Checkbox(
              value: controller.taskList[index]['completed'],
              onChanged: (value) => controller.taskCompleted(index),
              activeColor: const Color.fromARGB(255, 222, 51, 39),
            )),
            title: Obx(() => Text(controller.taskList[index]['name'])),
          ),
        ),
      ),
    );
  }
}
