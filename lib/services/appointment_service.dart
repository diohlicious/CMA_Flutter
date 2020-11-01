import 'dart:convert';
import 'dart:core';

import 'package:startup_namer/network/network_endpoints.dart';
import 'package:http/http.dart' as http;

class AppointmentService {
  dynamic data;

  Future<List> fetchAppointment() async {

    var result = await http.get(NetworkEndpoints.BASE_URL+'/appointment/');
    data = json.decode(result.body);
    return data;
  }

}
