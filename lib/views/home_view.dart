import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:startup_namer/app/route.dart';
import 'package:startup_namer/widgets/ad_item.dart';

class FavItem {
  String _img;
  String _title;
  String _onTap;

  FavItem(this._img, this._title, this._onTap);
}

class HomeView extends StatefulWidget {
  static const String routeName = '/home';
  final favItem = [
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
    this._getData();

    super.initState();
  }

  //==============================================Get Data Json===========================================
  List _adData;

  Future<String> _getData() async {
    var response = await rootBundle.loadString('assets/json/adhome.json');

    this.setState(() {
      _adData = json.decode(response);
    });
    _listAd();

    print(_adData[1]["title"]);

    return "Success!";
  }

  int _currentIndex = 0;
  List cardList = new List();

  void _listAd() {
    for (var i = 0; i < _adData.length; i++) {
      cardList.add(Item1(adData: _adData[i]));
    }
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget build(BuildContext context) {
    var _favColumn = <Widget>[];
    var _favRow = <Widget>[];
    var chunks = [];
    for (var i = 0; i < widget.favItem.length; i += 4) {
      chunks.add(widget.favItem.sublist(
          i, i + 4 > widget.favItem.length ? widget.favItem.length : i + 4));
    }
    for (var i = 0; i < chunks.length; i++) {
      for (var j = 0; j < chunks[i].length; j++) {
        var d = chunks[i][j];
        _favRow.add(
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, d._onTap),
              child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: Image(
                          image: AssetImage(d._img),
                          height: 40,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            d._title,
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
      _favColumn.add(Row(
        children: _favRow,
      ));
      _favRow = [];
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: _cardHeader(),
          ),
          Column(
            children: _favColumn,
          ),
          Container(
              child: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 6),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                stops: [0.5, 0],
                                colors: [Colors.blue, Colors.blue[100]]),
                          ),
                          child: card,
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          )),
        ],
      ),
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
