import 'package:flutter/material.dart';

class MitraAssign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Assign",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          toolbarHeight: 40,
          backgroundColor: Colors.blue[300],
        ),
        body: Center(child: Text("Assign Mitra")));
  }
}
