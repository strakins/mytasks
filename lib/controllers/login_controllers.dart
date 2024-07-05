import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/pages/taskspage.dart';


class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || 
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Get.to(() => TasksPage());
    } else {
      Get.snackbar('Error', 'Please fill input');
    }
  }
}
