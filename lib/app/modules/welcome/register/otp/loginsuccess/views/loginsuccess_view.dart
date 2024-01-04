import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/widgets/apotech_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loginsuccess_controller.dart';

class LoginsuccessView extends GetView<LoginsuccessController> {
  const LoginsuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 58,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 95,
                  ),
                  Image.asset(
                    'assets/images/login_success.png',
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 51,
                  ),
                  const Text(
                    'Phone Number Verified',
                    style: ApotechTypography.h1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Congradulations, your phone number has been verified. You can start using the app',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: purpleText.withOpacity(0.45),
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                width: double.infinity,
                child: ApotechButton(
                    child: const Text(
                      'CONTINUE',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    onPressed: () {}),
              ),
            ),
            const SizedBox(
              height: 26,
            )
          ],
        ));
  }
}
