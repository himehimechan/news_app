import 'package:get/get.dart';
import 'package:news_app/modules/detail/detail.dart';

import 'package:news_app/modules/home/home.dart';
import 'package:news_app/screens/detail.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/splash.dart';

class Routes {
  static const String root = '/';
  static const String home = '/home';
  static const String detail = '/home/detail';
}

final List<GetPage> routes = [
  GetPage(name: Routes.root, page: () => const Splash()),
  GetPage(name: Routes.home, page: () => Home(Get.find()), binding: HomeBindings()),
  GetPage(name: Routes.detail, page: () => Detail(Get.find()), binding: DetailBindings()),
];