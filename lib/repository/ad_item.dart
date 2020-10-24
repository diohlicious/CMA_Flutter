import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Item1 extends StatelessWidget {
  final Map<String, dynamic> adData;

  const Item1({Key key, this.adData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0, 1],
            colors: [Color(0xFF1e6a35), Colors.blue[100]]),
      ),
      child: //Text(adData.toString()),
          Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.fromLTRB(16, 10, 0, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          adData['msgTitle'] ?? '',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          adData['msgDesc'] ?? '',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(16, 18, 0, 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              adData['msgValiduntil'] ?? '',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              adData['msgValiduntilDesc'] ?? '',
                              textAlign: TextAlign.end,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      )),
                ],
              )),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(adData['msgHighlight'] ?? '',
                          style: TextStyle(
                              color: Color(0xFF0F346A),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      Text(adData['msgHighlightDesc'] ?? '',
                          style: TextStyle(
                              color: Color(0xFF0F346A),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600)),
                    ],
                  )))
        ],
      ),
    );
  }
}
