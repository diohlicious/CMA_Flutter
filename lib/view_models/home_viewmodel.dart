
import 'package:flutter/cupertino.dart';
import 'package:startup_namer/app/route.dart';
import 'package:startup_namer/models/home_hdr_model.dart';

class HomeViewModel extends ChangeNotifier{

  List favMenus = new List();

  Future<List> fetchFavMenus() async {
    this.favMenus = [
      FavItem('assets/images/ic_attendance.png', 'Attendance', Routes.attendance),
      FavItem('assets/images/ic_route.png', 'Route', Routes.vroute),
      FavItem('assets/images/ic_mitra.png', 'Mitra', Routes.mitra),
      FavItem('assets/images/ic_add.png', 'Add', null),
      FavItem('assets/images/ic_appointment.png', 'Appointment', null),
      FavItem('assets/images/ic_recovery.png', 'Recovery', null),
      FavItem('assets/images/ic_archive.png', 'Archive', null),
      FavItem('assets/images/ic_find.png', 'Find', null),
    ];
    return favMenus;
  }

}
