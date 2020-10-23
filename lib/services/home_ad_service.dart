import 'dart:convert';

import 'package:flutter/services.dart';

//==============================================Get Data Json===========================================

class HomeAdService {
  List _adData= new List();

  Future<List> fetchAds() async {
    var response = await rootBundle.loadString('assets/json/adhome.json');

    _adData = json.decode(response);

    return _adData;
  }
}
