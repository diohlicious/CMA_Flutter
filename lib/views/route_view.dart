
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';
import 'package:startup_namer/models/marker_model.dart';
import 'package:startup_namer/view_models/route_viewmodel.dart';
import 'package:startup_namer/views/account_detail_view.dart';
import 'package:startup_namer/widgets/appbar_widget.dart';

class RouteView extends StatefulWidget {
  static const String routeName = '/vroute';

  @override
  _RouteViewState createState() => _RouteViewState();
}

class _RouteViewState extends State<RouteView> {
  List data;

  @override
  void initState() {
    this.getData();
    super.initState();
  }

/*//==============================================Get Data Json===========================================
  Future<String> _getData() async {
    var response = await rootBundle.loadString('assets/json/account.json');

    this.setState(() {
      data = json.decode(response);
    });
    _getMap();

    return "Success!";
  }*/
  void getData() {
    RouteViewModel().fetchAcc().then((value){
      setState(() {
        data = value;
        for (var i = 0; i < data.length; i++) {
            _latlon(i);
        }
      });
    });
  }

  //==============================================Set Map===========================================
  GoogleMapController mapController;
  List<Map<String, dynamic>> locations = new List();
  Set<MarkerModel> markersList = new Set();

  void _latlon(int index) {
    String d;
    String n;
    String m;
    for (var i = 0; i < data[index]['Address'].length; i++) {
      if (data[index]['Address'][i]['Priority'] == '1' &&
          data[index]['Address'][i]['LatLong'].length > 0) {
        d = data[index]['Address'][i]['LatLong'];
        n = data[index]['CustomerFullName'];
        m = data[index]['Address'][i]['Address'];
        List _latLonParse = d.split(',');
        double _latD = double.parse(_latLonParse[0]);
        double _lonD = double.parse(_latLonParse[1]);

        locations.add({
          'Location_Number': d,
          'Location_Name': n,
          'Location_Desc': m,
          'coordinates': [_lonD, _latD]
        });
      }
    }
  }

  // add the markers to the markersList
  void _addMarkers() {
    locations.forEach((Map<String, dynamic> location) {
      final MarkerModel marker = MarkerModel(
          location['Location_Name'], location['Location_Desc'],
          id: MarkerId(location['Location_Number']),
          lat: location['coordinates'][1],
          lng: location['coordinates'][0],
          onTap: null);

      markersList.add(marker);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    // update map controller
    setState(() {
      mapController = controller;
    });
    // add the markers to the map
    _addMarkers();

    // create bounding box for view
    LatLngBounds _bounds = FindBoundsCoordinates().getBounds(markersList);

    // adjust camera to boundingBox
    controller.animateCamera(CameraUpdate.newLatLngBounds(_bounds, 100.0));
  }

  //==============================================Get Nested from data===========================================

  String _addressStr(int index) {
    String d;
    for (var i = 0; i < data[index]['Address'].length; i++) {
      if (data[index]['Address'][i]['Priority'] == '1') {
        d = data[index]['Address'][i]['Address'];
      }
    }
    return d;
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
    return GestureDetector(
        child: Card(
          elevation: 3,
          shape: (RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0))),
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
                child: Column(
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AccountDetailView(dataModel: data[index]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        mainTitle: 'Route',
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(0, 0),
                zoom: 14.0,
              ),
              markers: markersList.toSet(),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: _itemBuilder),
          ),
          //Text(data.runtimeType.toString()),
        ],
      ),
    );
  }
}

class FindBoundsCoordinates {
  LatLngBounds getBounds(Set<MarkerModel> locations) {
    List<double> latitudes = [];
    List<double> longitude = [];

    locations.toList().forEach((index) {
      latitudes.add(index.position.latitude);
      longitude.add(index.position.longitude);
    });

    return LatLngBounds(
      southwest: LatLng(latitudes.reduce(min), longitude.reduce(min)),
      northeast: LatLng(latitudes.reduce(max), longitude.reduce(max)),
    );
  }
}
