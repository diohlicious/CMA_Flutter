

import 'dart:convert';
import 'package:flutter/services.dart';

class AccountServices {
  //==============================================Get Data Json===========================================
  List data;
  Future<List> fetchAcc() async {
    var response = await rootBundle.loadString('assets/json/account.json');

      data = json.decode(response);

    return data;
  }
}
