import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/core/theme/utils.dart';
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
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Dental',
        'asset': 'assets/images/dental.svg',
        'ontap': () => Get.toNamed(Routes.CATEGORYLIST),
      },
      {
        'title': 'Wellness',
        'asset': 'assets/images/wellness.svg',
        'ontap': () => Get.toNamed(Routes.CATEGORYLIST),
      },
      {
        'title': 'Homeo',
        'asset': 'assets/images/homeo.svg',
        'ontap': () => Get.toNamed(Routes.CATEGORYLIST),
      },
      {
        'title': 'Eye Care',
        'asset': 'assets/images/eye_care.svg',
        'ontap': () => Get.toNamed(Routes.CATEGORYLIST),
      },
      {
        'title': 'Skin & Hair',
        'asset': 'assets/images/skin_hair.svg',
        'ontap': () => Get.toNamed(Routes.CATEGORYLIST),
      },
    ];

    final dealList = [
      {
        'title': 'Accu-check Active Test Strip',
        'price': 112000,
        'rating': '4.2',
        'asset': 'assets/images/bottle_1.png',
      },
      {
        'title': 'Omron HEM-8712 BP Monitor',
        'price': 150000,
        'rating': '4.5',
        'asset': 'assets/images/bottle_2.png',
      },
      {
        'title': 'Accu-check Active Test Strip',
        'price': 112000,
        'rating': '4.2',
        'asset': 'assets/images/bottle_1.png',
      },
      {
        'title': 'Omron HEM-8712 BP Monitor',
        'price': 150000,
        'rating': '4.5',
        'asset': 'assets/images/bottle_2.png',
      },
    ];

    final List<Map<String, dynamic>> featuredBrands = [
      {
        'title': 'Himalaya Wellness',
        'asset': 'assets/images/himalaya.png',
      },
      {
        'title': 'Accu-Chek',
        'asset': 'assets/images/accucheck.png',
      },
      {
        'title': 'Vlcc',
        'asset': 'assets/images/vlcc.png',
      },
      {
        'title': 'Protinex',
        'asset': 'assets/images/protinex.png',
      }
    ];
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: primaryColor,
      ),
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/ic_home.svg',
                    color: controller.homeIndex.value == 0
                        ? primaryColor
                        : purpleText.withOpacity(0.45),
                    width: 18,
                    height: 18,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/ic_notification.svg',
                    color: controller.homeIndex.value == 1
                        ? primaryColor
                        : purpleText.withOpacity(0.45),
                    width: 18,
                    height: 18,
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
                    width: 18,
                    color: controller.homeIndex.value == 3
                        ? primaryColor
                        : purpleText.withOpacity(0.45),
                    height: 18,
                  ),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/ic_person.svg',
                    color: controller.homeIndex.value == 4
                        ? primaryColor
                        : purpleText.withOpacity(0.45),
                    width: 18,
                    height: 18,
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
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topSection(),
                      const SizedBox(
                        height: 24,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text(
                          'Top Categories',
                          style: TextStyle(
                              color: purpleText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 12.h,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return categoriesItem(
                                index,
                                categories[index]['title'],
                                categories[index]['asset'],
                                categories[index]['ontap']);
                          },
                          itemCount: categories.length,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Obx(
                        () => Stack(
                          children: [
                            CarouselSlider(
                              items: [
                                Image.asset(
                                  'assets/images/carousel_1.png',
                                ),
                                Image.asset('assets/images/carousel_1.png'),
                                Image.asset('assets/images/carousel_1.png'),
                              ],
                              options: CarouselOptions(
                                onPageChanged: (index, reason) =>
                                    controller.carouselIndex.value = index,
                                height: 18.h,
                                viewportFraction: 1,
                                enableInfiniteScroll: true,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 5),
                              ),
                            ),
                            Positioned(
                              bottom: 14,
                              left: 0,
                              right: 0,
                              child: DotsIndicator(
                                decorator: const DotsDecorator(
                                  spacing: EdgeInsets.symmetric(horizontal: 4),
                                  size: Size.square(4),
                                  activeSize: Size.square(4),
                                  activeColor: primaryColor,
                                ),
                                dotsCount: 3,
                                position: controller.carouselIndex.value,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Deals of the Day',
                              style: TextStyle(
                                fontSize: 16,
                                color: purpleText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'More',
                                style: TextStyle(
                                    color: Color(0xFF006AFF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dealList.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                SizedBox(
                                  width: index == 0 ? 24 : 16,
                                ),
                                dealsCard(
                                    dealList[index]['title'] as String,
                                    dealList[index]['price'] as int,
                                    dealList[index]['rating'] as String,
                                    dealList[index]['asset'] as String),
                                index == dealList.length - 1
                                    ? const SizedBox(
                                        width: 24,
                                      )
                                    : const SizedBox()
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text(
                          'Featured Brands',
                          style: TextStyle(
                            fontSize: 16,
                            color: purpleText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 130,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: featuredBrands.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                SizedBox(
                                  width: index == 0 ? 24 : 16,
                                ),
                                featuredBrandItem(
                                    featuredBrands[index]['asset'] as String,
                                    featuredBrands[index]['title'] as String),
                                index == featuredBrands.length - 1
                                    ? const SizedBox(
                                        width: 24,
                                      )
                                    : const SizedBox()
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                ),
                const Center(
                  child: Text('Notification'),
                ),
                const Center(
                  child: Text('Add'),
                ),
                const Center(
                  child: Text('Cart'),
                ),
                const Center(
                  child: Text('Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox featuredBrandItem(String asset, String title) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Image.asset(asset),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Card dealsCard(String title, int price, String rating, String asset) {
    return Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: Colors.white,
          width: 50.w,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 135,
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEEF0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  asset,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 0, 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13,
                              color: purpleText,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatCurrency(price),
                            style: const TextStyle(
                              color: purpleText,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            decoration: const BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.white, size: 13),
                                Text(
                                  rating,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  GestureDetector categoriesItem(
      int index, String title, String asset, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(70),
        ),
        margin: EdgeInsets.only(left: index == 0 ? 24 : 10),
        padding: const EdgeInsets.fromLTRB(8, 7, 8, 21),
        child: Column(
          children: [
            SvgPicture.asset(
              asset,
              width: 48,
              height: 48,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
                color: purpleText.withOpacity(0.95),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox topSection() {
    return SizedBox(
      height: 27.h,
      child: Stack(
        children: [
          Container(
            height: 24.h,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 17, 24, 44),
            decoration: const BoxDecoration(
              color: primaryColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 21,
                        backgroundImage:
                            AssetImage('assets/images/login_success.png'),
                      ),
                    ),
                    Row(
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/images/ic_notification.svg',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/images/ic_cart.svg',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Hi, Lorem',
                  style: ApotechTypography.h1.copyWith(color: Colors.white),
                ),
                const Text(
                  'Welcome to Apotech',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 24,
            right: 24,
            child: Material(
              elevation: 1,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Medicine & Healthcare products',
                  hintStyle: ApotechTypography.defafult,
                  prefixIcon: Icon(
                    Icons.search,
                    color: purpleText.withOpacity(0.45),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
