import 'package:flutter/material.dart';
import './navigation.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: Navigation(),
        body: Center(child: Text("Home")));
  }
}