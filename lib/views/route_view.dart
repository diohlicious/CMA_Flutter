import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';

class RouteView extends StatefulWidget {
  static const String routeName = '/vroute';

  @override
  _RouteViewState createState() => _RouteViewState();
}

class _RouteViewState extends State<RouteView> {
  List data;
  final Set<Marker> _markers = {};

  Future<String> getData() async {
    var response = await rootBundle.loadString('assets/json/account.json');

    this.setState(() {
      data = json.decode(response);
    });

    print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    this.getData();

    super.initState();
  }

  String _addressStr(int index) {
    String d;
    for (var i = 0; i < data[index]['Address'].length; i++) {
      if (data[index]['Address'][i]['Priority'] == '1') {
        d = data[index]['Address'][i]['Address'];
      }
    }
    return d;
  }

  void _latlon(int index) {
    String d;
    for (var i = 0; i < data[index]['Address'].length; i++) {
      if (data[index]['Address'][i]['Priority'] == '1' &&
          data[index]['Address'][i]['LatLong'].length > 0) {
        d = data[index]['Address'][i]['LatLong'];
        List _latLonParse = d.split(',');
        double _latD = double.parse(_latLonParse[0]);
        double _lonD = double.parse(_latLonParse[1]);
        _markers.add(Marker(
          markerId: MarkerId(d),
          position: LatLng(_latD, _lonD),
          icon: BitmapDescriptor.defaultMarker,
        ));
      }
    }
  }

  String _separator(int index) {
    MoneyFormatterOutput fo = FlutterMoneyFormatter(
            amount: double.parse(data[index]['OSPrincipalAmount'].toString()))
        .output;
    return fo.withoutFractionDigits.toString();
  }

  String _woDate(int index) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    String _woDateTime = data[index]['WODate'];
    DateTime dateTime = dateFormat.parse(_woDateTime);
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    return formattedDate;
  }

  //-------------------------------------------Recycler View----------------------------------------

  Widget _itemBuilder(BuildContext context, int index) {
    _latlon(index);
    return Card(
        elevation: 3,
        shape:
            (RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Icon(
                data[index]['AssetType'] == 'MOTOR'
                    ? Icons.motorcycle
                    : Icons.directions_car,
                size: 64,
                color: Colors.blue[300],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index]['CustomerFullName'],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      Text(
                          data[index]['AgreementNo'] +
                              ' · ' +
                              data[index]['LicensePlate'],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          )),
                      Text(_addressStr(index),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          )),
                      Text(
                          _separator(index).toString() +
                              ' · ' +
                              _woDate(index) +
                              ' (WO Date)',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          )),
                    ],
                  )
                ]))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(3.595196, 98.672226),
                zoom: 14.0,
              ),
              markers: _markers,
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: _itemBuilder),
          ),
        ],
      ),
    );
  }
}
