import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/controllers/task_controller.dart';
import 'package:tasklist/components/dialogue_widget.dart';
import 'package:tasklist/components/taskwidget_card.dart';
import 'package:tasklist/models/task_model.dart';



class TasksPage extends StatelessWidget {
  TasksPage({super.key});

  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void saveTask(BuildContext context) {
    _taskController.addTask(
      Task(
        title: _titleController.text,
        description: _descriptionController.text,
        creationDate: DateTime.now().toLocal(),
      ),
    );
    _titleController.clear();
    _descriptionController.clear();
    Navigator.pop(context);
  }

  void updateTask(BuildContext context, int index) {
    _titleController.text = _taskController.taskList[index].title;
    _descriptionController.text = _taskController.taskList[index].description;
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          titleController: _titleController,
          descriptionController: _descriptionController,
          onSave: () {
            _taskController.updateTask(
              index,
              Task(
                title: _titleController.text,
                description: _descriptionController.text,
                creationDate: _taskController.taskList[index].creationDate,
                isCompleted: _taskController.taskList[index].isCompleted,
              ),
            );
            _titleController.clear();
            _descriptionController.clear();
            Navigator.pop(context);
          },
          onCancel: () {
            _titleController.clear();
            _descriptionController.clear();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void createTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          titleController: _titleController,
          descriptionController: _descriptionController,
          onSave: () {
            saveTask(context);
          },
          onCancel: () {
            Navigator.pop(context);
          },
        );
      },
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
            SizedBox(height: 8),
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
          backgroundColor: Color.fromARGB(255, 13, 200, 241),
          onPressed: () {
            createTask(context);
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Obx(() => buildStatCard(
                        "Total Tasks",
                        _taskController.totalTasks,
                        Colors.blue,
                      )),
                ),
                Expanded(
                  child: Obx(() => buildStatCard(
                        "Completed Tasks",
                        _taskController.completedTasks,
                        Color.fromARGB(255, 235, 125, 117),
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
                    itemCount: _taskController.taskList.length,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        task: _taskController.taskList[index],
                        onChanged: (value) {
                          _taskController.toggleTaskCompletion(index);
                        },
                        onDelete: () {
                          _taskController.deleteTask(index);
                        },
                        onEdit: () {
                          updateTask(context, index);
                        },
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

