import 'package:flutter/material.dart';
import 'package:startup_namer/view_models/appointment_viewmodel.dart';
import 'package:startup_namer/widgets/ads_carousel.dart';
import 'package:startup_namer/widgets/fav_menu_widget.dart';
import 'package:startup_namer/widgets/home_header_widget.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';

  final List<dynamic> favItem;
  final List<dynamic> adsItem;

  const HomeView({Key key, this.favItem, this.adsItem}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: ExactAssetImage('assets/images/3405625.jpg'),
            fit: BoxFit.fill,
          )),
          child: Text(
            'Background vector created by freepik - www.freepik.com',
            style: TextStyle(fontSize: 12, color: Colors.grey[400]),
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: HomeHeaderWidget(),
          ),
          //Text(widget.favItem.toString()),
          Container(
            child: FavMenuWidget(favItem: widget.favItem),
            //Text(favItem.toString())
          ),
          Container(
            child: AdsCarousel(ads: widget.adsItem),
          )
        ]),
      ],
    ));
  }
}
