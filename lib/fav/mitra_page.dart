import 'package:flutter/material.dart';
import 'package:startup_namer/menu/navigation.dart';
import './mitra_list.dart' as list;
import './mitra_assign.dart' as assign;

class MitraPage extends StatelessWidget {
  static const String routeName = '/mitra';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mitra"),
      ),
      drawer: Navigation(),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 43,
            backgroundColor: Colors.green[400],
            actions: <Widget>[],
            elevation: 0,
            title: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
              indicatorColor: Colors.white,
              indicatorWeight: 2,
            ),
          ),
          body: TabBarView(
              children: <Widget> [
              list.MitraList(),
              assign.MitraAssign(),
        ],
      ),
    ),)
    );
  }
}
