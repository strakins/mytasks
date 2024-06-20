import 'package:flutter/material.dart';
import 'package:tasklist/components/dialogue_widget.dart';
import 'package:tasklist/components/taskwidget_card.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final _controller = TextEditingController();
  List taskList = [
    ["Visit the Mall", false],
    ["Complete KodeCamp Task 3", true],
    ["Go for driving class", false],
  ];

  int get totalTasks => taskList.length;
  int get completedTasks => taskList.where((task) => task[1] == true).length;

  void taskCompleted(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  void saveTask() {
    setState(() {
      taskList.add([_controller.text, false]);
      _controller.clear();
      Navigator.pop(context);
    });
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  void updateTask(int index) {
    _controller.text = taskList[index][0];
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          controller: _controller,
          onSave: () {
            setState(() {
              taskList[index][0] = _controller.text;
              _controller.clear();
              Navigator.pop(context);
            });
          },
          onCancel: () {
            _controller.clear();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          controller: _controller,
          onSave: () {
            saveTask();
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
          actions: const <Widget> [
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
            opacity: 10.0
          ),
          backgroundColor: const Color.fromARGB(255, 28, 95, 107),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 13, 200, 241),
          onPressed: () {
            createTask();
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: buildStatCard(
                    "Total Tasks", 
                    totalTasks, Colors.blue
                  ),
                ),
                Expanded(
                  child: buildStatCard(
                    "Completed Tasks", 
                    completedTasks, Color.fromARGB(255, 235, 125, 117)
                  ),
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
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    taskName: taskList[index][0],
                    taskCompleted: taskList[index][1],
                    onChanged: (value) => taskCompleted(value, index),
                    onDelete: (context) => deleteTask(index),
                    onEdit: (context) => updateTask(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:tasklist/components/dialogue_widget.dart';
// import 'package:tasklist/components/taskwidget_card.dart';

// class TasksPage extends StatefulWidget {
//   const TasksPage({super.key});

//   @override
//   State<TasksPage> createState() => _TasksPageState();
// }

// class _TasksPageState extends State<TasksPage> {
//   final _controller = TextEditingController();
//   List taskList = [
//     ["Task 1", false],
//     ["Task 2", true],
//     ["Task 3", false],
//   ];

//   void taskCompleted(bool? value, int index) {
//     setState(() {
//       taskList[index][1] = !taskList[index][1];
//     });
//   }

//   void saveTask() {
//     setState(() {
//       taskList.add([_controller.text, false]);
//       _controller.clear();
//       Navigator.pop(context);
//     });
//   }

//   void deleteTask(int index) {
//     setState(() {
//       taskList.removeAt(index);
//     });
//   }

//   void updateTask(int index) {
//     _controller.text = taskList[index][0];
//     showDialog(
//       context: context,
//       builder: (context) {
//         return DialogWidget(
//           controller: _controller,
//           onSave: () {
//             setState(() {
//               taskList[index][0] = _controller.text;
//               _controller.clear();
//               Navigator.pop(context);
//             });
//           },
//           onCancel: () {
//             _controller.clear();
//             Navigator.pop(context);
//           },
//         );
//       },
//     );
//   }

//   void createTask() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return DialogWidget(
//           controller: _controller,
//           onSave: () {
//             saveTask();
//           },
//           onCancel: () {
//             Navigator.pop(context); 
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: const Color.fromARGB(255, 27, 133, 151),
//           appBar: AppBar(
//             title: const Text(
//                   "Hello, Strakins 👋",
//                   style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
//             ),
//             actions: const <Widget> [
//                Padding(
//                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
//                  child: Icon(Icons.search),
//                ),
//                Padding(
//                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
//                  child: Icon(Icons.notifications),
//                ),
//             ],
//             actionsIconTheme: const IconThemeData(
//               size: 25.0,
//               color: Colors.white,
//               opacity: 10.0
//             ),
//             backgroundColor: const Color.fromARGB(255, 28, 95, 107),
//           ),

//           floatingActionButton: FloatingActionButton(
//             backgroundColor: Color.fromARGB(255, 13, 200, 241),
//             onPressed: () {
//               createTask();
//             },
//             child: const Icon(Icons.add),
//           ),
//           body: ListView.builder(
//                   itemCount: taskList.length,
//                   itemBuilder: (context, index) {
//                     return TaskCard(
//                       taskName: taskList[index][0],
//                       taskCompleted: taskList[index][1],
//                       onChanged: (value) => taskCompleted(value, index),
//                       onDelete: (value) =>  deleteTask(index),
//                       onEdit: (value) => updateTask(index), // Add an edit callback
//                     );
//                   },
            
//           )
//         ),
//     );
//   }
// }
