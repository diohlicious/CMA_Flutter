import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    this.openContainer,
    this.isActive,
    this.image,
    this.title,
  });
  final VoidCallback openContainer;
  final bool isActive;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context){
    return RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
            splashColor: Colors.white70,
            color: Colors.white,
            disabledColor: Colors.grey[100],
            highlightColor: Colors.green[100],
            /*shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),*/
            onPressed: isActive//d['_isActive']
                ? openContainer//() => Navigator.pushNamed(context, d['_onTap'])
                : null,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Image(
                    image: AssetImage(image
                    ), //d['_image']
                    height: 40,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: //Text(d['_title']+' - '+d['_img']+' - '+d['_onTap'],
                    Text(
                      title,
                      //d._title,
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    )),
              ],
            ),
        );
  }
}