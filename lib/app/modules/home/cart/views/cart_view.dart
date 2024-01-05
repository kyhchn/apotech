import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/core/theme/utils.dart';
import 'package:apotech/app/widgets/apotech_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      '${controller.listItem.length} items in your cart',
                      style: ApotechTypography.defafult
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => controller.addItem(),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              color: Color(0xFF4157FF),
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            Text(
                              'Add more',
                              style: ApotechTypography.defafult.copyWith(
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFF4157FF),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: Obx(
                  () => ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return cartItem(index);
                      },
                      separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Divider(
                              color: Colors.black.withOpacity(0.05),
                              thickness: 1,
                            ),
                          ),
                      itemCount: controller.listItem.length),
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(0.05),
                thickness: 1,
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: const Color(0xFFE0E0E0).withOpacity(0.6),
                      width: 1),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/ic_discount.svg',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '1 Coupon applied',
                      style: TextStyle(
                          color: Color(0xFF27AE60),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/images/ic_cancel.svg',
                          width: 20,
                          height: 20,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Payment Summary',
                style: TextStyle(
                    color: purpleText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              summaryRow('Order Total', formatCurrency(228000)),
              summaryRow('Items Discount', '- ${formatCurrency(28800)}'),
              summaryRow('Coupon Discount', '- ${formatCurrency(15800)}'),
              summaryRow('Shipping', 'Free'),
              const SizedBox(
                height: 16,
              ),
              Divider(
                color: Colors.black.withOpacity(0.05),
                thickness: 1,
              ),
              summaryRow('Total', formatCurrency(185000), isBold: true),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                child: ApotechButton(
                    child: const Text(
                      'Place Order @ Rp 185.000',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {}),
              ),
              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding summaryRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isBold
                ? ApotechTypography.defafult.copyWith(color: purpleText)
                : ApotechTypography.defafult,
          ),
          Text(
            value,
            style: isBold
                ? const TextStyle(
                    color: purpleText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)
                : const TextStyle(
                    color: purpleText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  IntrinsicHeight cartItem(int index) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xFFF3F3F3),
              image: DecorationImage(
                image: AssetImage(
                  index % 2 == 0
                      ? 'assets/images/diet_2.jpg'
                      : 'assets/images/diet_3.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sugar free gold',
                      style: TextStyle(
                          color: purpleText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                        onTap: () => controller.removeItem(index),
                        child: SvgPicture.asset(
                          'assets/images/ic_cancel.svg',
                          width: 20,
                          height: 20,
                        ))
                  ],
                ),
                Text(
                  'bottle of 500 pellets',
                  style: TextStyle(
                    fontSize: 13,
                    color: purpleText.withOpacity(0.45),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatCurrency(25000),
                      style: const TextStyle(
                          color: purpleText,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Container(
                      height: 32,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: const Color(0xFFF2F4FF),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.decrementItem(index),
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFFDFE3FF),
                              radius: 16,
                              child: Icon(
                                Icons.remove,
                                size: 12,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Obx(
                              () => Text(
                                controller.listItem[index].value.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.incrementItem(index),
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFFA0ABFF),
                              radius: 16,
                              child: Icon(
                                Icons.add,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
