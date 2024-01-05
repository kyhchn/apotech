import 'package:get/get.dart';

import '../controllers/categorylist_controller.dart';

class CategorylistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategorylistController>(
      () => CategorylistController(),
    );
  }
}
