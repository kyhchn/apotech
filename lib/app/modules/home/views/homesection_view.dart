import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/core/theme/utils.dart';
import 'package:apotech/app/modules/home/controllers/home_controller.dart';
import 'package:apotech/app/routes/app_pages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomesectionView extends GetView {
  const HomesectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      body: SingleChildScrollView(
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
                      controller.categories[index]['title'],
                      controller.categories[index]['asset'],
                      controller.categories[index]['ontap']);
                },
                itemCount: controller.categories.length,
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
                itemCount: controller.dealList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: index == 0 ? 24 : 16,
                      ),
                      dealsCard(
                          controller.dealList[index]['title'] as String,
                          controller.dealList[index]['price'] as int,
                          controller.dealList[index]['rating'] as String,
                          controller.dealList[index]['asset'] as String),
                      index == controller.dealList.length - 1
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
                itemCount: controller.featuredBrands.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: index == 0 ? 24 : 16,
                      ),
                      featuredBrandItem(
                          controller.featuredBrands[index]['asset'] as String,
                          controller.featuredBrands[index]['title'] as String),
                      index == controller.featuredBrands.length - 1
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
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.PRODUCTDETAIL, arguments: {
              'title': title,
              'price': price,
              'rating': rating,
              'imageAsset': asset
            });
          },
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
                            AssetImage('assets/images/dummy_pp.jpg'),
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
                            onTap: () => Get.toNamed(Routes.CART),
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
