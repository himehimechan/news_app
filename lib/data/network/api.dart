import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

part 'api_constant.dart';
part 'api_exception.dart';
part 'api_handler.dart';

class Api {
  static final ApiHandler _handler = ApiHandler();

  static Future allData(String q) async{
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    var a = await _handler.get("${ApiUrl.getAllData}?q=$q&from=$formattedDate&sortBy=publishedAt&${ApiUrl.apiKey}");
    return a;
  }
}