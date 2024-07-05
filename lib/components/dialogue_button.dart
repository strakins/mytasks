import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? onPressed;

  const DialogButton({
    Key? key,
    required this.buttonName,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: MaterialButton(
        onPressed: onPressed,
        color: Get.theme.primaryColor,
        child: Text(
          buttonName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
