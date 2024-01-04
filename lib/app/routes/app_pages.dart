import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/walkthrough/bindings/walkthrough_binding.dart';
import '../modules/walkthrough/views/walkthrough_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/login/bindings/login_binding.dart';
import '../modules/welcome/login/views/login_view.dart';
import '../modules/welcome/register/bindings/register_binding.dart';
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
        ),
      ],
    ),
  ];
}
