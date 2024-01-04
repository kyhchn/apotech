import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/routes/app_pages.dart';
import 'package:apotech/app/widgets/apotech_button.dart';
import 'package:apotech/app/widgets/apotech_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back!',
                  style: ApotechTypography.h1,
                ),
                const SizedBox(
                  height: 24,
                ),
                ApotechTextField(
                  controller: controller.nameController,
                  hintText: 'Your Name',
                  keyboardType: TextInputType.name,
                  useLabel: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                ApotechTextField(
                  controller: controller.phoneController,
                  onTap: () {
                    controller.phoneController.text == ''
                        ? controller.phoneController.text = '+62 '
                        : controller.phoneController.text;
                  },
                  hintText: 'Mobile Number',
                  keyboardType: TextInputType.phone,
                  useLabel: true,
                  inputFormatters: [controller.numberFormat],
                ),
                const SizedBox(
                  height: 10,
                ),
                ApotechTextField(
                  controller: controller.emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  useLabel: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                ApotechTextField(
                  controller: controller.passwordController,
                  hintText: 'Password',
                  isPasswordType: true,
                  useLabel: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ApotechButton(
                      child: const Text(
                        'CREATE ACCOUNT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () => Get.toNamed(Routes.OTP,
                          arguments: controller.phoneController.text)),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 12,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Get.offNamed(Routes.LOGIN),
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // the '2023' part
                        ),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: purpleText.withOpacity(0.45),
                        )),
                    GestureDetector(
                      onTap: () => Get.offNamed(Routes.LOGIN),
                      child: Text(
                        "Already have account? Login",
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

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '+62 '); // Add +62 when empty
    }
    final strippedValue = newValue.text.replaceAll(RegExp(r'\s+'), '');
    final formattedValue = '+62 ' +
        strippedValue.replaceAllMapped(
            RegExp(r'.{1,3}'), (match) => '${match.group(0)} ');
    return newValue.copyWith(
      text: formattedValue.trim(),
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
