import 'package:flutter/material.dart';
import 'package:startup_namer/resource/values/app_colors.dart';

class HomeHeaderWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    //-------------------------------------------------Header
      return Card(
        elevation: 6,
        color: AppColors.DARK_BLUE,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack (
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                //border: Border(top: BorderSide(width: 1.0, color: Colors.blue[200]),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/imgbin_blue-green-color.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
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

          ],
        ),

      );
  }
}

Widget _itemHeader(String _title, String _img, String _pct, String _text) {
  return Expanded(
    flex: 1,
    child: Card(
      color: Color(0x66FFFFFF),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        //side: BorderSide(color: Colors.blue, width: 0.9),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Container(
              alignment: Alignment(-1.0, 0.0),
              margin: EdgeInsets.fromLTRB(2, 2, 0, 2),
              child: Text(
                _title,
                style: TextStyle(fontSize: 18, color: Colors.white),
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
                    style: TextStyle(fontSize: 14, color: Colors.white),
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
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
    ),
  );
}