
import 'package:flutter/cupertino.dart';
import 'package:startup_namer/services/fav_firestore_service.dart';

class HomeViewModel extends ChangeNotifier{

  List fav;

  Future<List> fetchFav() async {
    final results =  await FavFirestoreService().fetchFav();
    this.fav = results['data'];
    return fav;
  }
}
