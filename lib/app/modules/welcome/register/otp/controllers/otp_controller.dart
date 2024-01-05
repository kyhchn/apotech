import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final otpController = TextEditingController();
  final key = GlobalKey<FormState>();
  late Timer _timer;
  final start = 60.obs;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }

  void resetTimer() {
    start.value = 60;
    _timer.cancel();
    startTimer();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    startTimer();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
