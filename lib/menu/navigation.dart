import 'package:flutter/material.dart';
import 'package:startup_namer/route/route.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.home)),
          _createDrawerItem(
              icon: Icons.article_outlined,
              text: 'Tasks',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.tasks)),
          _createDrawerItem(
              icon: Icons.article_outlined,
              text: 'Mitra',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.mitra)),
        ],
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/drawer_header.png'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("CMA Demo",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
