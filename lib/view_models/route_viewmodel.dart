import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:startup_namer/utils/network_util.dart';

class RouteViewModel extends ChangeNotifier {
  List<RouteViewModel> data= List<RouteViewModel>(); ;

  //==============================================Get Data Json===========================================
  Future<void> _fetchData() async {
    final results = await Webservices()._fetchData();
    this.data = results.map((item) => RouteViewModel (dataObject: item)).toList();

    print(this.data);
    notifyListeners();
  }

}