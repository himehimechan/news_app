import 'package:get/get.dart';
import 'package:news_app/models/allNewsData.dart';

import 'package:news_app/modules/detail/detail.dart';

class DetailController extends GetxController {

  final DetailService _service;

  DetailController(this._service);

  var entry = Articles();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    entry = Get.arguments;
  }

}