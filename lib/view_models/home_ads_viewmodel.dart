
import 'package:flutter/material.dart';
import 'package:startup_namer/services/home_ad_service.dart';

class HomeAdsViewModel extends ChangeNotifier {

  List ads = new List();

  Future<List> fetchAds() async {
    final results =  await HomeAdService().fetchAds();
    this.ads = results;
    return ads;
  }
}