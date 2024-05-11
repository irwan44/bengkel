import 'package:get/get.dart';

import '../modules/authorization/bindings/authorization_binding.dart';
import '../modules/authorization/componen/forget_password.dart';
import '../modules/authorization/componen/login_page.dart';
import '../modules/authorization/componen/signup_next.dart';
import '../modules/authorization/componen/signup_page.dart';
import '../modules/authorization/views/authorization_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHORIZATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHORIZATION,
      page: () => const AuthorizationView(),
      binding: AuthorizationBinding(),
    ),
    GetPage(
      transition: Transition.downToUp,
      name: _Paths.SINGIN,
      page: () => LoginPage(),
      binding: AuthorizationBinding(),
    ),
    GetPage(
      transition: Transition.downToUp,
      name: _Paths.SINGUP,
      page: () => SignupPage(),
      binding: AuthorizationBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.SINGUPNEXT,
      page: () => SignupPageNext(),
      binding: AuthorizationBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.LUPAPASSWORD,
      page: () => ForgetPasswordPage(),
      binding: AuthorizationBinding(),
    ),
  ];
}
