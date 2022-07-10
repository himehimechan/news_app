
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'api_request_status.dart';

class Functions {

  static bool checkConnectionError(e) {
    if (e.toString().contains('SocketException') ||
        e.toString().contains('HandshakeException')) {
      return true;
    } else {
      return false;
    }
  }

  static APIRequestStatus checkError(e) {
    if (Functions.checkConnectionError(e)) {
      return APIRequestStatus.connectionError;
    } else {
      return APIRequestStatus.error;
    }
  }

  static bool checkFormValid(GlobalKey<FormState> globalKey){
    if(globalKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  static String ConvertDateTime(String date){
    var inputFormat = DateFormat("yyyy-MM-dd");
    var outputFormat = DateFormat("dd-MM-yyyy");

    var dateInput = inputFormat.parse(date);
    var dateInputParse = outputFormat.format(dateInput);
    String dateParse = dateInputParse.toString();
    return dateParse;
  }

  static String ConvertDateToDays(String date){
    var inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    var dateInput = inputFormat.parse(date);
    var dateInputParse = DateFormat('EEEE').format(dateInput);
    String dateParse = dateInputParse.toString();
    return dateParse;
  }

}
