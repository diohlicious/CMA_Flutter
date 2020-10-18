import 'package:flutter/material.dart';
import 'package:startup_namer/views/attendance_view.dart';
import 'package:startup_namer/views/home_view.dart';
import 'package:startup_namer/views/mitra_view.dart';
import 'package:startup_namer/views/route_view.dart';



class Routes {
  static const String home = HomeView.routeName;
  static const String attendance = AttendanceView.routeName;
  static const String vroute = RouteView.routeName;
  static const String mitra = MitraView.routeName;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case attendance:
        return MaterialPageRoute(builder: (_) => AttendanceView());
      case vroute:
        return MaterialPageRoute(builder: (_) => RouteView());
      case mitra:
        return MaterialPageRoute(builder: (_) => MitraView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
