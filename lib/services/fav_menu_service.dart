import 'dart:convert';
import 'dart:core';

import 'package:startup_namer/network/network_endpoints.dart';
import 'package:http/http.dart' as http;

class FavMenuService {
  dynamic data;

  Future<List> fetchFav() async {

    var result = await http.get(NetworkEndpoints.BASE_URL+'/favmenu/');
    data = json.decode(result.body);
    return data;
  }

}
