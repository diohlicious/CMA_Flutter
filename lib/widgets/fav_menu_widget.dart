import 'package:flutter/material.dart';

class FavMenuWidget extends StatefulWidget {
  final List<dynamic> favItem;

  const FavMenuWidget({Key key, this.favItem}) : super(key: key);

  _FavMenuWidget createState()=>_FavMenuWidget();
}

class _FavMenuWidget extends State<FavMenuWidget>{

  @override
  Widget build(BuildContext context) {
    //Navigator.pushNamed(context,d['_onTap'])

    var _favColumn = <Widget>[];
    var _favRow = <Widget>[];
    var chunks = [];
    for (var i = 0; i < widget.favItem.length; i += 4) {
      chunks.add(
          widget.favItem.sublist(i, i + 4 > widget.favItem.length ? widget.favItem.length : i + 4));
    }
    for (var i = 0; i < chunks.length; i++) {
      for (var j = 0; j < chunks[i].length; j++) {
        var d = chunks[i][j];
        _favRow.add(
          Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(3,10,3,10),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
                  splashColor: Colors.white70,
                  color: Colors.white,
                  disabledColor: Colors.grey[100],
                  highlightColor: Colors.green[100],
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(12.0)),
                  onPressed: d['_isActive']
                      ? () => Navigator.pushNamed(context, d['_onTap'])
                      : null,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: Image(
                          image: AssetImage(d['_image']), //d['_image']
                          height: 40,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: //Text(d['_title']+' - '+d['_img']+' - '+d['_onTap'],
                              Text(
                            d['_title'],
                            //d._title,
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          )),
                    ],
                  ),
                ),
              )),
        );
      }
      for (var j = 0; j < 4 - chunks[i].length; j++) {
        _favRow.add(
          Expanded(
            child: Container(),
            flex: 1,
          ),
        );
      }
      _favColumn.add(Row(
        children: _favRow,
      ));
      _favRow = [];
    }

    return Column(
      children: _favColumn,
    );
  }
}
