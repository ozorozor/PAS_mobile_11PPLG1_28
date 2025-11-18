import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_28/bindings/favorite_binding.dart';
import 'package:pas_mobile_11pplg1_28/bindings/list_product_binding.dart';
import 'package:pas_mobile_11pplg1_28/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg1_28/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg1_28/bindings/splashscreen_binding.dart';
import 'package:pas_mobile_11pplg1_28/pages/dashboard_page.dart';
import 'package:pas_mobile_11pplg1_28/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg1_28/pages/list_product_page.dart';
import 'package:pas_mobile_11pplg1_28/pages/login_page.dart';
import 'package:pas_mobile_11pplg1_28/pages/profile_page.dart';
import 'package:pas_mobile_11pplg1_28/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg1_28/routes/app_routes.dart';
import 'package:pas_mobile_11pplg1_28/pages/register_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.loginpage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
    ),
    GetPage(
      name: AppRoutes.profilepage,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: AppRoutes.listproductpage,
      page: () => ListProductPage(),
      binding: ListProductBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: '/favorites',
      page: () => const FavoritePage(),
      binding: FavoriteBinding(),
    ),
  ];
}
