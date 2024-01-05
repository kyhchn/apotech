import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/constant.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/core/theme/utils.dart';
import 'package:apotech/app/widgets/apotech_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/productdetail_controller.dart';

class ProductdetailView extends GetView<ProductdetailController> {
  const ProductdetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String title = Get.arguments['title'];
    final String imageAsset = Get.arguments['imageAsset'];
    final String rating = Get.arguments['rating'];
    final int price = Get.arguments['price'];

    final listPackage = [
      {'price': 252000, 'pellets': 500},
      {'price': 100000, 'pellets': 110},
      {'price': 160000, 'pellets': 300},
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {},
              child: SvgPicture.asset(
                'assets/images/ic_notification.svg',
                color: purpleText,
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
                color: purpleText,
                width: 24,
                height: 24,
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: purpleText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Etiam mollis metus non purus',
                    style: ApotechTypography.defafult,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: [
                carouselItem(imageAsset),
                carouselItem(imageAsset),
                carouselItem(imageAsset),
              ],
              options: CarouselOptions(
                onPageChanged: (index, reason) =>
                    controller.carouselIdx.value = index,
                height: 18.h,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Center(
              child: Obx(
                () => DotsIndicator(
                  dotsCount: 3,
                  decorator: const DotsDecorator(
                    spacing: EdgeInsets.symmetric(horizontal: 4),
                    size: Size.square(4),
                    activeSize: Size.square(4),
                    activeColor: primaryColor,
                  ),
                  position: controller.carouselIdx.value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatCurrency(price),
                            style: const TextStyle(
                                color: purpleText,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Etiam mollis',
                            style: ApotechTypography.defafult,
                          )
                        ],
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_plus.svg',
                                  color: const Color(0xFF006AFF),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Add to cart',
                                  style: TextStyle(
                                      color: Color(0xFF006AFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.1),
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    'Package Size',
                    style: TextStyle(
                        color: purpleText,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 68,
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          packageItem(index, listPackage),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Product Details',
                    style: TextStyle(
                        color: purpleText,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    fillerString,
                    style: TextStyle(
                        color: purpleText.withOpacity(0.45),
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Rating and Reviews',
                    style: TextStyle(
                        color: purpleText,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  rating,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 33,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: primaryYellow,
                                  size: 26,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              '923 Ratings\nand 257 Reviews',
                              style: ApotechTypography.defafult,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        VerticalDivider(
                          color: Colors.black.withOpacity(0.1),
                          width: 1,
                          thickness: 1,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              ratingIndicator(5, 0.67),
                              ratingIndicator(4, 0.20),
                              ratingIndicator(3, 0.7),
                              ratingIndicator(2, 0),
                              ratingIndicator(1, 0.02),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Lorem Hoffman',
                              style: TextStyle(color: purpleText, fontSize: 14),
                            ),
                            Text(
                              '05-oct 2023',
                              style: ApotechTypography.defafult,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: primaryYellow, size: 12),
                            Text(
                              rating,
                              style: ApotechTypography.defafult,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          fillerString,
                          style: TextStyle(
                              color: purpleText.withOpacity(0.45),
                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        )
                      ],
                    ),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(0, 22, 0, 16),
                      child: Divider(
                        color: purpleText.withOpacity(0.1),
                        thickness: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ApotechButton(
                        child: Text(
                          'GO TO CART',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {}),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row ratingIndicator(
    int rating,
    double percentage,
  ) {
    return Row(
      children: [
        Text(
          rating.toString(),
          style: ApotechTypography.defafult,
        ),
        const Icon(
          Icons.star,
          size: 16,
          color: primaryYellow,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.grey.withOpacity(0.2),
            color: primaryColor,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          '${(percentage * 100).toInt()}%',
          style: ApotechTypography.defafult,
        ),
      ],
    );
  }

  Obx packageItem(int index, List<Map<String, dynamic>> listPackage) {
    return Obx(
      () => Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () => controller.packageSizeIdx.value = index,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: index == controller.packageSizeIdx.value
                    ? primaryYellow.withOpacity(0.05)
                    : const Color(0xFFF5F5F5),
                border: Border.all(
                    color: index == controller.packageSizeIdx.value
                        ? primaryYellow
                        : Colors.transparent),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatCurrency(listPackage[index]['price']),
                    style: TextStyle(
                        color: index == controller.packageSizeIdx.value
                            ? primaryYellow
                            : purpleText,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  Text(
                    '${listPackage[index]['pellets']} pellets',
                    style: TextStyle(
                        color: index == controller.packageSizeIdx.value
                            ? primaryYellow
                            : purpleText.withOpacity(0.75),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
    );
  }

  Container carouselItem(String imageAsset) {
    return Container(
      width: 90.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        imageAsset,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
