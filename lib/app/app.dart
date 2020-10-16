import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/app/route.dart';
import 'package:startup_namer/views/attendance_view.dart';
import 'package:startup_namer/views/drawer_view.dart';
import 'package:startup_namer/views/home_view.dart';
import 'package:startup_namer/views/mitra_view.dart';

class MyApp extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMA Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigation(),
      routes: {
        Routes.home: (context) => HomeView(),
        Routes.attendance: (context) => AttendanceView(),
        Routes.mitra: (context) => MitraView()},
    );
  }
}