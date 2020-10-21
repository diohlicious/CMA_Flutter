import 'dart:convert';

import 'package:flutter/services.dart';

class Webservices{

  Future<List<ok>> _fetchData() async {
    var response = await rootBundle.loadString('assets/json/account.json');

    final List data = json.decode(response);

    return data;
  }
}