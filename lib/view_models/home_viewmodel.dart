
import 'package:flutter/cupertino.dart';
import 'package:startup_namer/services/fav_menu_service.dart';

class HomeViewModel extends ChangeNotifier{

  List fav;

  Future<List> fetchFav() async {
    final results =  await FavMenuService().fetchFav();
    this.fav = results;
    return fav;
  }
}
