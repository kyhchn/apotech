import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/core/theme/utils.dart';
import 'package:apotech/app/modules/home/views/homesection_view.dart';
import 'package:apotech/app/modules/home/views/profilesection_view.dart';
import 'package:apotech/app/routes/app_pages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: primaryColor,
      ),
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            iconSize: 18,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/ic_home.svg',
                    color: controller.homeIndex.value == 0
                        ? primaryColor
                        : purpleText.withOpacity(0.45),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/ic_notification.svg',
                    color: controller.homeIndex.value == 1
                        ? primaryColor
                        : purpleText.withOpacity(0.45),
                  ),
                  label: 'Notification'),
              BottomNavigationBarItem(
                  backgroundColor: primaryColor,
                  icon: Container(
                    padding: const EdgeInsets.all(11),
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: SvgPicture.asset(
                      'assets/images/ic_plus.svg',
                      color: Colors.white,
                      width: 18,
                      height: 18,
                    ),
                  ),
                  label: 'Add'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/ic_cart.svg',
                    color: controller.homeIndex.value == 3
                        ? primaryColor
                        : purpleText.withOpacity(0.45),
                  ),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/ic_person.svg',
                    color: controller.homeIndex.value == 4
                        ? primaryColor
                        : purpleText.withOpacity(0.45),
                  ),
                  label: 'Profile'),
            ],
            currentIndex: controller.homeIndex.value,
            onTap: (index) => controller.homeIndex.value = index,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        backgroundColor: const Color(0xFFF7FBFF),
        body: SafeArea(
          child: Obx(
            () => IndexedStack(
              index: controller.homeIndex.value,
              children: const [
                HomesectionView(),
                Center(
                  child: Text('Notification'),
                ),
                Center(
                  child: Text('Add'),
                ),
                Center(
                  child: Text('Cart'),
                ),
                ProfilesectionView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
