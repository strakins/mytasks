import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
    this.onDelete,
    this.onEdit, // Add onEdit callback
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final void Function(BuildContext)? onDelete;
  final void Function(BuildContext)? onEdit; // Add onEdit callback

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete_forever_outlined,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8.0),
            ),
            SlidableAction(
              onPressed: onEdit,
              icon: Icons.edit,
              backgroundColor: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            leading: Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: const Color.fromARGB(255, 222, 51, 39),
            ),
            title: Text(taskName),
          ),
        ),
      ),
    );
  }
}
