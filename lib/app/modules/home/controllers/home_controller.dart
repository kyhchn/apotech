import 'package:apotech/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final carouselIndex = 0.obs;
  final homeIndex = 0.obs;
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

  final List<Map<String, dynamic>> profileListTile = [
    {
      'image': 'assets/images/ic_private.svg',
      'title': 'Private Account',
    },
    {
      'image': 'assets/images/ic_consult.svg',
      'title': 'My Consults',
    },
    {
      'image': 'assets/images/ic_orders.svg',
      'title': 'My orders',
    },
    {
      'image': 'assets/images/ic_billing.svg',
      'title': 'Billing',
    },
    {
      'image': 'assets/images/ic_faq.svg',
      'title': 'Faq',
    },
    {
      'image': 'assets/images/ic_setting.svg',
      'title': 'Settings',
    },
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
