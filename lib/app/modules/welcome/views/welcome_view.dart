import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/routes/app_pages.dart';
import 'package:apotech/app/widgets/apotech_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                Image.asset('assets/images/welcome.png', height: 31.h),
                const SizedBox(
                  height: 34,
                ),
                const Text(
                  'Welcome to Apotech',
                  textAlign: TextAlign.center,
                  style: h1,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Do you want some help with your health to get better life?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: purpleText.withOpacity(0.45),
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 34,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ApotechButton(
                    type: Type.primary,
                    child: const Text(
                      'SIGN UP WITH EMAIL',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    onPressed: () => Get.toNamed(Routes.REGISTER),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ApotechButton(
                    type: Type.secondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/facebook.svg',
                            height: 18, width: 18),
                        const SizedBox(
                          width: 21,
                        ),
                        const Text(
                          'CONTINUE WITH FACEBOOK',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: purpleText),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ApotechButton(
                    type: Type.secondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/google.svg',
                            height: 18, width: 18),
                        const SizedBox(
                          width: 21,
                        ),
                        const Text(
                          'CONTINUE WITH GMAIL',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: purpleText),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: purpleText.withOpacity(0.45),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
