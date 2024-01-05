import 'package:get/get.dart';

import '../controllers/checkoutsuccess_controller.dart';

class CheckoutsuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutsuccessController>(
      () => CheckoutsuccessController(),
    );
  }
}
