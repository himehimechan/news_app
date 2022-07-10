
import 'package:news_app/models/allNewsData.dart';

import '../../data/network/api.dart';

class HomeService {

  Future<AllNewsData?> allNewsData(String pencarian) async {
    try {
      var res = await Api.allData(pencarian);
      AllNewsData dataJson;
      dataJson = AllNewsData.fromJson(res);
      return dataJson;
    } catch (e) {
      return null;
    }
  }

}