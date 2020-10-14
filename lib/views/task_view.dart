import 'package:flutter/material.dart';
import 'drawer_view.dart';

class TaskView extends StatelessWidget {
  static const String routeName = '/tasks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Task"),
        ),
        drawer: Navigation(),
        body: Center(child: Text("Task")));
  }
}