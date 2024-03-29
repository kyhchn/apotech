import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/utils.dart';
import 'package:apotech/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/categorylist_controller.dart';

class CategorylistView extends GetView<CategorylistController> {
  const CategorylistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dietList = [
      {'title': 'Sugar Substitute', 'imageAsset': 'assets/images/diet_1.jpg'},
      {'title': 'Juices & Vinegars', 'imageAsset': 'assets/images/diet_2.jpg'},
      {'title': 'Vitamins Medicines', 'imageAsset': 'assets/images/diet_3.png'},
    ];

    final productList = [
      {
        'title': 'Accu-check Active Test Strip',
        'imageAsset': 'assets/images/product_1.png',
        'rating': '4.5',
        'price': 112000
      },
      {
        'title': 'Omron HEM-8712 BP Monitor',
        'imageAsset': 'assets/images/product_2.png',
        'rating': '4.5',
        'price': 150000
      },
      {
        'title': 'Accu-check Active Test Strip',
        'imageAsset': 'assets/images/product_3.png',
        'rating': '4.2',
        'price': 112000
      },
      {
        'title': 'Omron HEM-8712 BP Monitor',
        'imageAsset': 'assets/images/product_4.png',
        'rating': '4.1',
        'price': 150000
      }
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Diabetes Care',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/carousel_1.png',
                width: double.infinity - 48,
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Diabetic Diet',
                  style: TextStyle(
                      color: purpleText,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 20.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dietList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(left: 24)
                          : index == dietList.length - 1
                              ? const EdgeInsets.symmetric(horizontal: 16)
                              : const EdgeInsets.only(left: 16),
                      child: dietItem(dietList[index]['title'] as String,
                          dietList[index]['imageAsset'] as String),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'All Products',
                  style: TextStyle(
                      color: purpleText,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 270,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0),
                    itemCount: productList.length,
                    itemBuilder: (context, index) => productItem(
                          productList[index]['title'] as String,
                          productList[index]['imageAsset'] as String,
                          productList[index]['rating'] as String,
                          productList[index]['price'] as int,
                          discount: index == 0
                              ? 'SALE'
                              : index == 1
                                  ? '15% OFF'
                                  : null,
                          discountColor: index == 0
                              ? const Color(0xFFFF5A5A)
                              : index == 1
                                  ? primaryYellow
                                  : null,
                        )),
              ),
              const SizedBox(
                height: 38,
              )
            ],
          ),
        ));
  }

  Card productItem(String title, String imageAsset, String rating, int price,
      {String? discount, Color? discountColor}) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFFEBEBEB), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Get.toNamed(Routes.PRODUCTDETAIL, arguments: {
          'title': title,
          'imageAsset': imageAsset,
          'rating': rating,
          'price': price
        }),
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    height: 155,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F7FA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 14, 0, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
            (discount != null && discountColor != null)
                ? Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 57.5,
                      height: 57.5,
                      decoration: const BoxDecoration(
                        color: Colors.transparent, // Latar belakang transparan
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(10)), // Sudut yang dibulatkan
                      ),
                      child: CustomPaint(
                        painter: TrianglePainter(discountColor),
                      ),
                    ),
                  )
                : const SizedBox(),
            (discount != null && discountColor != null)
                ? Positioned(
                    top: 12,
                    left: 2,
                    child: Transform.rotate(
                      angle: -45 *
                          3.1415926535 /
                          180, // Rotate text by -45 degrees
                      child: Text(
                        discount,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Card dietItem(String title, String imageAsset) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: const Color(0xFFF5F7FA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 29.w,
          height: double.infinity,
          child: Column(
            children: [
              Image.asset(
                imageAsset,
                height: 12.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 17),
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: purpleText,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
