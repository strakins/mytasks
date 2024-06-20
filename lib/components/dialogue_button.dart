import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.buttonname,
    this.onPressed,

  });

  final String buttonname;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: MaterialButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child: Text(
          buttonname,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
