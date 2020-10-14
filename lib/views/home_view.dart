import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'drawer_view.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Navigation(),
      body: Wrap(
        children: [_cardHeader()],
      )/*Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(children: [
            Wrap(children: [_cardHeader()]),
            Wrap(
              children: [_favorite()],
            )
          ])),*/
    );
  }
}

//-------------------------------------------------Header
Widget _cardHeader() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    elevation: 5,
    child: Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.blue[200]),
        ),
        color: Colors.white,
      ),
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
                    color: Colors.green[300],
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
              )),
        ]),
      ),
    ),
  );
}

//-------------------------------------------------Favorite
Widget _favorite() {
  return Row(
    children: [
      Container(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: FlatButton(
              padding: EdgeInsets.all(0.0),
              child: Image.asset('assets/images/ic_attendance.png')),
        ),
      ),
      Container(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: FlatButton(
              padding: EdgeInsets.all(0.0),
              child: Image.asset('assets/images/ic_route.png')),
        ),
      ),
    ],
  );
}
