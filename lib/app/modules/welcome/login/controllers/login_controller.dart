import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
