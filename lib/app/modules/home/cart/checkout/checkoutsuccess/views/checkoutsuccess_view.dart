import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/routes/app_pages.dart';
import 'package:apotech/app/widgets/apotech_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/checkoutsuccess_controller.dart';

class CheckoutsuccessView extends GetView<CheckoutsuccessController> {
  const CheckoutsuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                    'Thank you',
                    style: ApotechTypography.h1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Your Order will be delivered with invoice ',
                      style: TextStyle(
                        color: purpleText.withOpacity(0.45),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: '#INV20231212',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              '. You can track the delivery in the order section.',
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
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
                      'Continue Order',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    onPressed: () => Get.back()),
              ),
            ),
            const SizedBox(
              height: 26,
            )
          ],
        ),
      ),
    );
  }
}
