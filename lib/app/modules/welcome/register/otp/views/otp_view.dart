import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/routes/app_pages.dart';
import 'package:apotech/app/widgets/apotech_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final phoneNumber = Get.arguments['phone'];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter the verify code',
              style: ApotechTypography.h1,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'We just send you a verification code via phone $phoneNumber',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: purpleText.withOpacity(0.45)),
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              key: controller.key,
              child: SizedBox(
                width: double.infinity,
                child: Pinput(
                  validator: (String? value) {
                    if (value!.isEmpty || value.length != 6) {
                      return 'Please enter the code';
                    }
                  },
                  controller: controller.otpController,
                  onCompleted: (value) {
                    controller.otpController.text = value;
                  },
                  length: 6,
                  defaultPinTheme: PinTheme(
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    textStyle: TextStyle(
                        color: purpleText.withOpacity(0.45),
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: purpleText.withOpacity(0.1), width: 1),
                      ),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    height: 50,
                    width: 40,
                    textStyle: TextStyle(
                        color: purpleText.withOpacity(0.45),
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: purpleText, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            SizedBox(
              width: double.infinity,
              child: ApotechButton(
                  type: Type.primary,
                  child: const Text(
                    'SUBMIT CODE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (controller.key.currentState!.validate()) {
                      Get.offNamed(Routes.LOGINSUCCESS);
                    }
                  }),
            ),
            const SizedBox(
              height: 23,
            ),
            Center(
              child: Text(
                'The verify code will expire in 00:59',
                style: ApotechTypography.defafult,
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend code',
                    style: ApotechTypography.defafult
                        .copyWith(color: primaryColor),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
