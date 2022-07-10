import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/models/allNewsData.dart';

import '../../utils/api_request_status.dart';
import '../../utils/function.dart';
import 'home_service.dart';

class HomeController extends GetxController {

  final HomeService _service;

  HomeController(this._service);

  var dataNews = AllNewsData().obs;
  var apiRequestStatus = APIRequestStatus.unInitialized.obs;
  var inputTxtSearchKey = GlobalKey<FormFieldState>();
  var inputTxtSearch = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future getData() async{
    apiRequestStatus.value = APIRequestStatus.loading;
    try {
      dataNews.value = (await _service.allNewsData(inputTxtSearch.value.text.isEmpty ? "Indonesia" : inputTxtSearch.value.text))?? AllNewsData();

      apiRequestStatus.value = APIRequestStatus.loaded;
      print("Debug: ${dataNews.value.totalResults.toString()}");
    } catch (e) {
      apiRequestStatus.value = Functions.checkError(e);
      print("Debug: ${e.toString()}");
    }
  }

}