import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/repository/ad_item.dart';


class AdsCarousel extends StatefulWidget {

  final List ads;
  const AdsCarousel({Key key, this.ads}) : super(key: key);

  _AdsCarouselState createState() => _AdsCarouselState();
}

class _AdsCarouselState extends State<AdsCarousel> {

  @override
  void initState() {
    this._listAd();
    super.initState();
  }

  int _currentIndex = 0;
  List cardList = new List();

  void _listAd() {
    for (var i = 0; i < widget.ads.length; i++) {
      cardList.add(Item1(adData: widget.ads[i]));
    }
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

    @override
    Widget build(BuildContext context) {

      return Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 6),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: cardList.map((card) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.30,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            stops: [0.5, 0],
                            colors: [Color(0xFF0F346A), Colors.blue[100]]),
                      ),
                      child: card,
                    ),
                  ),
                );
              });
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(cardList, (index, url) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Colors.blueAccent
                      : Colors.grey,
                ),
              );
            }),
          ),
        ],
      );
  }
}


