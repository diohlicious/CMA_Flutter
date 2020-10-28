import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/view_models/home_ads_viewmodel.dart';
import 'package:startup_namer/view_models/home_viewmodel.dart';
import 'package:startup_namer/views/dashboard_view.dart';
import 'package:startup_namer/views/setting_view.dart';
import 'package:startup_namer/views/task_view.dart';
import 'package:startup_namer/widgets/appbar_widget.dart';

import 'home_view.dart';
import 'inbox_view.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class Navigation extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Home", CupertinoIcons.home),
    DrawerItem("Task", CupertinoIcons.doc),
    DrawerItem("Inbox", CupertinoIcons.tray_fill),
    DrawerItem("Dashboard", Icons.dashboard),
    DrawerItem("Settings", CupertinoIcons.settings),
    DrawerItem("Log Out", CupertinoIcons.power)
  ];

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedDrawerIndex = 0;

  @override
  void initState() {
    this.getData();
    super.initState();
  }

  List<dynamic> favItem;
  List<dynamic> adsItem;

  //dynamic favItem;

  void getData() {
    HomeViewModel().fetchFav().then((value) {
      setState(() {
        favItem = value;
      });
    });
    HomeAdsViewModel().fetchAds().then((value) {
      setState(() {
        adsItem = value;
      });
    });
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeView(favItem: favItem,adsItem: adsItem,);
      case 1:
        return TaskView();
      case 2:
        return InboxView();
      case 3:
        return DashboardView();
      case 4:
        return SettingView();
      default:
        return Text('');
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppbarWidget(mainTitle: widget.drawerItems[_selectedDrawerIndex].title),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/drawer_header.png'))),
                accountName: Text('CMA Demo',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500)),
                accountEmail: null),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
