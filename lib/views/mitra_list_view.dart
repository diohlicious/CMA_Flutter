import 'package:flutter/material.dart';

class MitraList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "List",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          toolbarHeight: 40,
          backgroundColor: Colors.blue[300],
        ),
        body: Center(child: Text("List Mitra")));
  }
}
