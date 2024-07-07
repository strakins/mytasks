import 'package:flutter/material.dart';
import 'package:tasklist/models/task_model.dart';

class TaskDetailPage extends StatelessWidget {
  final Task task;

  const TaskDetailPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 133, 151),
      appBar: AppBar(
        title: Text(
          task.title,
          style: const TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 28, 95, 107),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Title:  ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  '${task.title}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),  
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Description:  ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  '${task.description}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),  
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Date Created:  ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  '${task.creationDate.day} - '+ '${task.creationDate.month} - ' + '${task.creationDate.year}',
                  style: const TextStyle(fontSize: 18,  color: Colors.white),
                ),  
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Status:  ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  '${task.isCompleted ? "Completed Successfully" : "Not completed"}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),  
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
