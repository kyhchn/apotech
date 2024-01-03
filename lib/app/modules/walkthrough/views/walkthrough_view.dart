import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/routes/app_pages.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/walkthrough_controller.dart';

class WalkthroughView extends GetView<WalkthroughController> {
  const WalkthroughView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
              child: PageView(
                scrollBehavior: const ScrollBehavior().copyWith(
                    overscroll: false, physics: const ClampingScrollPhysics()),
                controller: controller.pageController,
                onPageChanged: (value) =>
                    controller.selectedPageIndex.value = value,
                children: [
                  walkthroughItem(
                      'assets/images/walkthrough_1.png',
                      'View and buy Medicine online',
                      'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.'),
                  walkthroughItem(
                      'assets/images/walkthrough_2.png',
                      'Online medicial & Healthcare',
                      'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.'),
                  walkthroughItem(
                      'assets/images/walkthrough_3.png',
                      'Get Delivery on time',
                      'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.'),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Get.offNamed(Routes.WELCOME),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          color: primaryColor.withOpacity(0.45),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Obx(
                    () => DotsIndicator(
                        decorator: const DotsDecorator(
                          size: Size.square(4),
                          activeSize: Size.square(4),
                          activeColor: primaryColor,
                        ),
                        dotsCount: 3,
                        position: controller.selectedPageIndex.value),
                  ),
                  TextButton(
                    onPressed: () {
                      if (controller.selectedPageIndex.value == 2) {
                        Get.offNamed(Routes.WELCOME);
                      } else {
                        controller.pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding walkthroughItem(String asset, String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Image.asset(
            asset,
            width: double.infinity,
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: h1,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: purpleText.withOpacity(0.45),
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    );
  }
}
