import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/core/theme/utils.dart';
import 'package:apotech/app/routes/app_pages.dart';
import 'package:apotech/app/widgets/apotech_button.dart';
import 'package:apotech/app/widgets/apotech_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 24),
          child: Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back!',
                  style: ApotechTypography.h1,
                ),
                ApotechTextField(
                  controller: controller.userNameController,
                  validator: validateIsNotEmpty,
                  hintText: 'Username',
                  leadingAsset: 'assets/images/ic_person.svg',
                ),
                const SizedBox(
                  height: 16,
                ),
                ApotechTextField(
                  controller: controller.passwordController,
                  validator: validateIsNotEmpty,
                  leadingAsset: 'assets/images/ic_lock.svg',
                  hintText: 'Password',
                  suffix: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot?',
                        style: TextStyle(
                            color: purpleText.withOpacity(0.45), fontSize: 12),
                      )),
                ),
                const SizedBox(
                  height: 56,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ApotechButton(
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        if (controller.key.currentState!.validate()) {
                          Get.offNamed(Routes.HOME);
                        }
                      }),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 12,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Get.back(),
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // the '2023' part
                        ),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: purpleText.withOpacity(0.45),
                        )),
                    GestureDetector(
                      onTap: () => Get.offNamed(Routes.REGISTER),
                      child: Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(
                            color: purpleText.withOpacity(0.45),
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
