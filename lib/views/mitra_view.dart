import 'package:flutter/material.dart';
import 'mitra_list_view.dart';
import 'mitra_assign_view.dart';

class MitraView extends StatelessWidget {
  static const String routeName = '/mitra';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mitra"),
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 43,
            backgroundColor: Colors.blue[400],
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
            children: <Widget>[
              MitraList(),
              MitraAssign(),
            ],
          ),
        ),
      ),
    );
  }
}
