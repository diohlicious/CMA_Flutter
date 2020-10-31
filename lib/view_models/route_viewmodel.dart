
import 'package:flutter/cupertino.dart';
import 'package:startup_namer/services/account_services.dart';

class RouteViewModel extends ChangeNotifier{

  List acc;

  Future<List> fetchAcc() async {
    final results =  await AccountServices().fetchAcc();
    this.acc = results;
    return acc;
  }
}
