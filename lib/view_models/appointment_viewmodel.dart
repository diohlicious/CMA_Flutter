
import 'package:flutter/cupertino.dart';
import 'package:startup_namer/services/appointment_service.dart';
import 'package:startup_namer/services/fav_menu_service.dart';
import 'package:startup_namer/views/appointment_view.dart';

class AppointmentViewModel extends ChangeNotifier{

  List fav;

  Future<List> fetchAppointment() async {
    final results =  await AppointmentService().fetchAppointment();
    this.fav = results;
    return fav;
  }
}
