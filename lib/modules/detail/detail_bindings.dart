import 'package:get/get.dart';

import 'package:news_app/modules/detail/detail.dart';

class DetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController(DetailService()));
  }
}