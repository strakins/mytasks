import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/components/dialogue_button.dart';

class DialogWidget extends StatelessWidget {
  final VoidCallback onSave, onCancel;
  final TextEditingController controller;

  const DialogWidget({
    Key? key,
    required this.onSave,
    required this.onCancel,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a Task",
                hintStyle: TextStyle(color: Color.fromARGB(255, 12, 12, 12)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogButton(
                  buttonName: "Create",
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                DialogButton(
                  buttonName: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
