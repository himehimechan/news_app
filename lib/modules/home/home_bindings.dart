import 'package:get/get.dart';

import 'package:news_app/modules/home/home.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(HomeService()));
  }
}