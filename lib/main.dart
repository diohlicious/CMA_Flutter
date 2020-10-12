import 'package:flutter/material.dart';
import 'package:startup_namer/fav/mitra_page.dart';
import 'package:startup_namer/route/route.dart';
import 'menu/home_page.dart';
import 'menu/navigation.dart';
import 'menu/task_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        Routes.home: (context) => HomePage(),
        Routes.tasks: (context) => TaskPage(),
        Routes.mitra: (context) => MitraPage(),
      },
    );
  }
}