import 'package:flutter/material.dart';

class FavItem {
  String _img;
  String _title;

  FavItem(this._img, this._title);
}

class HomeView extends StatefulWidget {
  final favItem = [
    FavItem('assets/images/ic_attendance.png', 'Attendance'),
    FavItem('assets/images/ic_route.png', 'Route'),
    FavItem('assets/images/ic_mitra.png', 'Mitra'),
    FavItem('assets/images/ic_add.png', 'Add'),
    FavItem('assets/images/ic_appointment.png', 'Appointment'),
    FavItem('assets/images/ic_recovery.png', 'Recovery'),
    FavItem('assets/images/ic_archive.png', 'Archive'),
    FavItem('assets/images/ic_find.png', 'Find'),
  ];

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              onTap: () => print("tapped"),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Image(image: AssetImage(d._img)),
                      Text(d._title, style: TextStyle(color: Colors.blue))
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

    return Container(
      child: Column(
        children: [
          Wrap(
            children: [_cardHeader()],
          ),
          Column(
            children: _favColumn,
          ),
        ],
      ),
    );
  }
}

//-------------------------------------------------Header
Widget _cardHeader() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
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
