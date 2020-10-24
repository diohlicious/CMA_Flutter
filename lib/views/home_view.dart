import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/app/route.dart';
import 'package:startup_namer/services/fav_firestore_service.dart';
import 'package:startup_namer/view_models/home_ads_viewmodel.dart';
import 'package:startup_namer/widgets/ads_carousel.dart';
import 'package:startup_namer/widgets/fav_menu_widget.dart';

class FavItem {
  String _title;
  String _onTap;
  String _img;
  FavItem(this._img, this._title, this._onTap);
}

class HomeView extends StatefulWidget {
  static const String routeName = '/home';
  List favMenus = [
  FavItem('assets/images/ic_attendance.png', 'Attendance', Routes.attendance),
  FavItem('assets/images/ic_route.png', 'Route', Routes.vroute),
  FavItem('assets/images/ic_mitra.png', 'Mitra', Routes.mitra),
  FavItem('assets/images/ic_add.png', 'Add', null),
  FavItem('assets/images/ic_appointment.png', 'Appointment', null),
  FavItem('assets/images/ic_recovery.png', 'Recovery', null),
  FavItem('assets/images/ic_archive.png', 'Archive', null),
  FavItem('assets/images/ic_find.png', 'Find', null),
  ];

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    this.getData();
    super.initState();
  }

  List dataUser;
  dynamic favItem;


  void getData() {
    HomeAdsViewModel().fetchAds().then((value) {
      setState(() {
        dataUser = value;
      });
    });
    FavFirestoreService().fetchFav().then((value){
      setState(() {
        favItem = value;
      });
    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: _cardHeader(),
          ),
          Container(
            child: FavMenuWidget(favItem: favItem['data']),
          ),
          Container(
            child: AdsCarousel(ads: dataUser),
          )
        ]),
    );
  }
}

//-------------------------------------------------Header
Widget _cardHeader() {
  return Card(
    elevation: 6,
    color: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
      padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 1.0, color: Colors.blue[200]),
      )),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 8, 8, 0),
              child: Text(
                'Achievement',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              _itemHeader(
                  'Target', 'assets/images/list_logo_reverse.png', '0.0', '0'),
              _itemHeader(
                  'Payment', 'assets/images/rp_logo_reverse.png', '0.0', '0'),
              _itemHeader(
                  'Cash In', 'assets/images/rp_logo_reverse.png', '0.0', '0'),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _itemHeader(String _title, String _img, String _pct, String _text) {
  return Expanded(
    flex: 1,
    child: Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.blue, width: 0.9),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Container(
              alignment: Alignment(-1.0, 0.0),
              margin: EdgeInsets.fromLTRB(2, 2, 0, 2),
              child: Text(
                _title,
                style: TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.center,
              )),
          Container(
            width: double.maxFinite,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image(
                    image: AssetImage(_img),
                    width: 30,
                    height: 30,
                  ),
                ),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  child: Text(
                    _pct,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment(1.0, 0.0),
            margin: EdgeInsets.fromLTRB(2, 2, 0, 2),
            child: Text(
              _pct,
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
    ),
  );
}
