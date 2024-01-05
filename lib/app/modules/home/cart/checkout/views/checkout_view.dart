import 'package:apotech/app/core/theme/colors.dart';
import 'package:apotech/app/core/theme/typography.dart';
import 'package:apotech/app/core/theme/utils.dart';
import 'package:apotech/app/routes/app_pages.dart';
import 'package:apotech/app/widgets/apotech_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2 Items in your cart',
                    style: ApotechTypography.defafult
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'TOTAL',
                        style: ApotechTypography.defafult
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        formatCurrency(185000),
                        style: const TextStyle(
                            color: purpleText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Delivery Address',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: purpleText),
              ),
              const SizedBox(
                height: 16,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 9,
                ),
                itemCount: controller.listAddress.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Obx(
                  () => RadioListTile(
                    contentPadding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: purpleText.withOpacity(0.1), width: 1),
                        borderRadius: BorderRadius.circular(6)),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.listAddress[index].name),
                        GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/images/ic_edit.svg',
                              width: 13,
                              height: 16,
                            ))
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.listAddress[index].phone),
                        Text(controller.listAddress[index].address),
                      ],
                    ),
                    value: index,
                    groupValue: controller.addressIndex.value,
                    onChanged: (value) {
                      controller.addressIndex.value = value as int;
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Spacer(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
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
                              'Add Address',
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
                height: 8,
              ),
              const Text(
                'Payment Method',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: purpleText),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: purpleText.withOpacity(0.1)),
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Obx(
                    () => RadioListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      contentPadding: EdgeInsets.zero,
                      title: Row(
                        children: [
                          Container(
                            height: 48,
                            width: 40,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: purpleText.withOpacity(0.1))),
                            child: Image.asset(
                              controller.listPayment[index].image,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            controller.listPayment[index].name,
                            style: const TextStyle(
                                color: purpleText,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      value: index,
                      groupValue: controller.paymentIndex.value,
                      onChanged: (value) {
                        controller.paymentIndex.value = value as int;
                      },
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  itemCount: controller.listPayment.length,
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              SizedBox(
                width: double.infinity,
                child: ApotechButton(
                    child: const Text(
                      'Pay Now Rp 185.000',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Get.offNamedUntil(Routes.CHECKOUTSUCCESS,
                          (route) => route.settings.name == Routes.HOME);
                    }),
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
