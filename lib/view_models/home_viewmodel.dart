import 'package:flutter/material.dart';

class FavItem {
  String _img;
  String _title;

  FavItem(this._img, this._title);
}

class HomeViewModel{
  final favItem = [
    FavItem('assets/images/ic_attendance.png', 'Attendance'),
    FavItem('assets/images/ic_route.png', 'Route'),
    FavItem('assets/images/ic_mitra.png', 'Mitra'),
    FavItem('assets/images/ic_add.png', 'Add'),
    FavItem('assets/images/ic_appointment.png', 'Appointment'),
    FavItem('assets/images/ic_recovery.png', 'Recovery'),
    FavItem('assets/images/ic_archive.png', 'Archive'),
    FavItem('assets/images/ic_find.png', 'Find'),
  ];

}
