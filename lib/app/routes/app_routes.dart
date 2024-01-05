part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const WALKTHROUGH = _Paths.WALKTHROUGH;
  static const WELCOME = _Paths.WELCOME;
  static const LOGIN = _Paths.WELCOME + _Paths.LOGIN;
  static const REGISTER = _Paths.WELCOME + _Paths.REGISTER;
  static const OTP = _Paths.WELCOME + _Paths.REGISTER + _Paths.OTP;
  static const LOGINSUCCESS =
      _Paths.WELCOME + _Paths.REGISTER + _Paths.OTP + _Paths.LOGINSUCCESS;
  static const CATEGORYLIST = _Paths.HOME + _Paths.CATEGORYLIST;
  static const PRODUCTDETAIL = _Paths.HOME + _Paths.PRODUCTDETAIL;
  static const CART = _Paths.HOME + _Paths.CART;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const WALKTHROUGH = '/walkthrough';
  static const WELCOME = '/welcome';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const OTP = '/otp';
  static const LOGINSUCCESS = '/loginsuccess';
  static const CATEGORYLIST = '/categorylist';
  static const PRODUCTDETAIL = '/productdetail';
  static const CART = '/cart';
}
