import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup_namer/resource/values/app_colors.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget{
  final String mainTitle;
  const AppbarWidget({Key key, this.mainTitle}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(56);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(mainTitle),//widget.drawerItems[_selectedDrawerIndex].title),
        flexibleSpace: Container(
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children:[
              Container(
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height ,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.8, 0.0),
                        colors: <Color>[
                          AppColors.DARK_BLUE,
                          Colors.white,
                        ])),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/toolbar_header2.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.height,
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/icon_launcher.png', height: 50,),
                      Text('Diohlicious', style: TextStyle(color: Colors.blue[800],)),
                    ],
                  )
              ),
            ],
          ),
        ));
  }



}
