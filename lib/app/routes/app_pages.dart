import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/cart/bindings/cart_binding.dart';
import '../modules/home/cart/checkout/bindings/checkout_binding.dart';
import '../modules/home/cart/checkout/checkoutsuccess/bindings/checkoutsuccess_binding.dart';
import '../modules/home/cart/checkout/checkoutsuccess/views/checkoutsuccess_view.dart';
import '../modules/home/cart/checkout/views/checkout_view.dart';
import '../modules/home/cart/views/cart_view.dart';
import '../modules/home/categorylist/bindings/categorylist_binding.dart';
import '../modules/home/categorylist/views/categorylist_view.dart';
import '../modules/home/productdetail/bindings/productdetail_binding.dart';
import '../modules/home/productdetail/views/productdetail_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/walkthrough/bindings/walkthrough_binding.dart';
import '../modules/walkthrough/views/walkthrough_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/login/bindings/login_binding.dart';
import '../modules/welcome/login/views/login_view.dart';
import '../modules/welcome/register/bindings/register_binding.dart';
import '../modules/welcome/register/otp/bindings/otp_binding.dart';
import '../modules/welcome/register/otp/loginsuccess/bindings/loginsuccess_binding.dart';
import '../modules/welcome/register/otp/loginsuccess/views/loginsuccess_view.dart';
import '../modules/welcome/register/otp/views/otp_view.dart';
import '../modules/welcome/register/views/register_view.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.CATEGORYLIST,
          page: () => const CategorylistView(),
          binding: CategorylistBinding(),
        ),
        GetPage(
          name: _Paths.PRODUCTDETAIL,
          page: () => const ProductdetailView(),
          binding: ProductdetailBinding(),
        ),
        GetPage(
          name: _Paths.CART,
          page: () => const CartView(),
          binding: CartBinding(),
          children: [
            GetPage(
              name: _Paths.CHECKOUT,
              page: () => const CheckoutView(),
              binding: CheckoutBinding(),
              children: [
                GetPage(
                  name: _Paths.CHECKOUTSUCCESS,
                  page: () => const CheckoutsuccessView(),
                  binding: CheckoutsuccessBinding(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GetPage(
      name: _Paths.WALKTHROUGH,
      page: () => const WalkthroughView(),
      binding: WalkthroughBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
      children: [
        GetPage(
          name: _Paths.LOGIN,
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: RegisterBinding(),
          children: [
            GetPage(
              name: _Paths.OTP,
              page: () => const OtpView(),
              binding: OtpBinding(),
              children: [
                GetPage(
                  name: _Paths.LOGINSUCCESS,
                  page: () => const LoginsuccessView(),
                  binding: LoginsuccessBinding(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
