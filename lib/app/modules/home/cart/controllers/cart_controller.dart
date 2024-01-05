import 'package:get/get.dart';

class CartController extends GetxController {
  final listItem = <RxInt>[1.obs, 1.obs].obs;

  void addItem() {
    listItem.add(1.obs);
    listItem.refresh();
  }

  void removeItem(int index) {
    listItem.removeAt(index);
    listItem.refresh();
  }

  void incrementItem(int index) {
    listItem[index]++;
  }

  void decrementItem(int index) {
    if (listItem[index] > 1) listItem[index]--;
  }

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
