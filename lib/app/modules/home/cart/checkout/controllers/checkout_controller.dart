import 'package:apotech/app/data/model/address.dart';
import 'package:apotech/app/data/model/payment.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final listAddress = <Address>[
    Address(
        name: 'Home', phone: "(205) 555-024", address: "1786 Wheeler Bridge"),
    Address(
        name: "Office",
        phone: "(205) 555-024",
        address: "1786 w Dallas St underfield")
  ];

  final listPayment = <Payment>[
    Payment(name: "Credit Card", image: "assets/images/cc.png"),
    Payment(name: "Paypal", image: "assets/images/paypal.png"),
    Payment(name: "Google Pay", image: "assets/images/google.png"),
    Payment(name: "Apple Pay", image: "assets/images/apple.png"),
  ];

  final paymentIndex = 0.obs;

  final addressIndex = 0.obs;

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
