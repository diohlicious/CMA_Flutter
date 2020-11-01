import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/app/route.dart';

import 'menu_card_widget.dart';
import 'open_container_wrapper.dart';

class FavMenuWidget extends StatefulWidget{
  final List<dynamic> favItem;

  const FavMenuWidget({Key key, this.favItem}) : super(key: key);

  _FavMenuWidget createState()=>_FavMenuWidget();
}

class _FavMenuWidget extends State<FavMenuWidget>{

  ContainerTransitionType _transitionType = ContainerTransitionType.fadeThrough;


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
          OpenContainerWrapper(
            transitionType: _transitionType,
            color: Colors.blue,
            milliseconds: 800,
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return MenuCard(
                openContainer: openContainer,
                isActive: d['_isActive'],
                image: d['_image'],
                title: d['_title'],
              );
            },
            //onClosed: _showMarkedAsDoneSnackbar,
            openBuilder: (BuildContext context, VoidCallback _) {
              return Routes.router(d['_onTap']);
            },
          ),
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
