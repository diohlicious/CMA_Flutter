
import 'package:flutter/material.dart';
import 'package:startup_namer/resource/values/app_colors.dart';
import 'package:startup_namer/view_models/home_ads_viewmodel.dart';
import 'package:startup_namer/widgets/ads_carousel.dart';
import 'package:startup_namer/widgets/fav_menu_widget.dart';
import 'package:startup_namer/widgets/home_header_widget.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';

  final List<dynamic> favItem;

  const HomeView({Key key, this.favItem}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    this.getData();
    super.initState();
  }

  List dataUser;
  dynamic favItem;


  void getData() {
    HomeAdsViewModel().fetchAds().then((value) {
      setState(() {
        dataUser = value;
      });
    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: HomeHeaderWidget(),
          ),
          Container(
            child: FavMenuWidget(favItem: widget.favItem),
            //Text(favItem.toString())
          ),
          Container(
            child: AdsCarousel(ads: dataUser),
          )
        ]),
    );
  }
}




