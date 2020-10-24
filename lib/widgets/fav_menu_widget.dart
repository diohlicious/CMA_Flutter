import 'package:flutter/material.dart';

class FavMenuWidget extends StatelessWidget {

  final List favItem;
  const FavMenuWidget({Key key, this.favItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _favColumn = <Widget>[];
    var _favRow = <Widget>[];
    var chunks = [];
    for (var i = 0; i < favItem.length; i += 4) {
      chunks.add(favItem.sublist(
          i, i + 4 > favItem.length ? favItem.length : i + 4));
    }
    for (var i = 0; i < chunks.length; i++) {
      for (var j = 0; j < chunks[i].length; j++) {
        var d = chunks[i][j].map;
        _favRow.add(
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => null,//Navigator.pushNamed(context, d._onTap),
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
                          image: AssetImage('assets/images/add.png'),//AssetImage(d._img),
                          height: 40,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(d.map.toString(),
                            //d._title,
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

    return Column(
      children: _favColumn,
    );
  }
}


