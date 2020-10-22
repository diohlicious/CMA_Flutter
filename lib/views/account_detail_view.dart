import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:startup_namer/model/my_markers.dart';

class AccountDetailView extends StatefulWidget {
  static const String routeName = '/accdtl';
  final Map<String, dynamic> dataModel;

  const AccountDetailView({Key key, this.dataModel}) : super(key: key);

  @override
  _AccountDetailViewState createState() => _AccountDetailViewState();
}


class _AccountDetailViewState extends State<AccountDetailView> {

  @override
  void initState() {
    this._addressStr();
    this._addMarkers();
    super.initState();
  }

  String _formattedDate(String _dateTime) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime _date = dateFormat.parse(_dateTime);
    String formattedDate = DateFormat('dd MMM yyyy').format(_date);
    return formattedDate;
  }

  GoogleMapController mapController;
  Set<MyMarker> markersList = new Set();

  List <Map<String,dynamic>> locations = new List();
  void _addMarkers() {

    for(var i = 0; i < widget.dataModel['Address'].length; i++){

      locations.add(widget.dataModel['Address'][i]);

    }
    locations.forEach((Map<String, dynamic> location) {
      List coordinates = location['LatLong'].split(', ');
      final MyMarker marker = MyMarker(
          location['Type'], '*',
          id: MarkerId(location['LatLong']),
          lat: double.parse(coordinates[0]),
          lng: double.parse(coordinates[1]),
          onTap: null);

      markersList.add(marker);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    // update map controller
    setState(() {
      mapController = controller;

    });

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(_latMarker, _lonMarker), zoom: 12.0),
      ),
    );

    // add the markers to the map

  }

  String _addressSelected;
  double _latMarker;
  double _lonMarker;

  void _addressStr() {
    String d;
    String s;

    for (var i = 0; i < widget.dataModel['Address'].length; i++) {
      if (widget.dataModel['Address'][i]['Priority'] == '1') {
        d = widget.dataModel['Address'][i]['Address']??'';
        s = widget.dataModel['Address'][i]['LatLong']??'';
        List _latLonParse = s.split(',');
        _latMarker = double.parse(_latLonParse[0]);
        _lonMarker = double.parse(_latLonParse[1]);

      }

    }
    setState(() {
      _addressSelected = d;

    });
  }



  void _selectAddressResidence() {
    String d;
    String s;
    double _lat;
    double _lon;
    for (var i = 0; i < widget.dataModel['Address'].length; i++) {
      if (widget.dataModel['Address'][i]['Type'] == 'Residence') {
          d=widget.dataModel['Address'][i]['Address']??'';
          s = widget.dataModel['Address'][i]['LatLong'];
          List _latLonParse = s.split(',');
          _lat = double.parse(_latLonParse[0]);
          _lon = double.parse(_latLonParse[1]);
        }
    }
    setState(() {
      _addressSelected = d;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(_lat, _lon), zoom: 12.0),
        ),
      );
    });
  }
  void _selectAddressLegal() {
    String d;
    String s;
    double _lat;
    double _lon;
    for (var i = 0; i < widget.dataModel['Address'].length; i++) {
        if(widget.dataModel['Address'][i]['Type'] == 'Legal'){
          d=widget.dataModel['Address'][i]['Address']??'';
          s = widget.dataModel['Address'][i]['LatLong'];
          List _latLonParse = s.split(',');
          _lat = double.parse(_latLonParse[0]);
          _lon = double.parse(_latLonParse[1]);
        }
    }
    setState(() {
      _addressSelected = d;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(_lat, _lon), zoom: 12.0),
        ),
      );
    });
  }
  void _selectAddressCompany() {
    String d;
    String s;
    double _lat;
    double _lon;
    for (var i = 0; i < widget.dataModel['Address'].length; i++) {
      if (widget.dataModel['Address'][i]['Type'] == 'Company') {
          d=widget.dataModel['Address'][i]['Address']??'';
          s = widget.dataModel['Address'][i]['LatLong'];
          List _latLonParse = s.split(',');
          _lat = double.parse(_latLonParse[0]);
          _lon = double.parse(_latLonParse[1]);
        }
    }
    setState(() {
      _addressSelected = d;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(_lat, _lon), zoom: 12.0),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context, String _body) {
      // set up the button
      Widget okButton = FlatButton(
        child: Text("Ok"),
        onPressed: () {},
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        content: Text(_body ?? ''),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Account Detail'),
      ),
      body: //-----------------------------------Personal Section-------<
          Column(
        children: [
          Container(
            child: Card(
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      child: Text('Personal Information',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          )),
                    ),
                    Container(
                      width: double.maxFinite,
                      child: Text(
                        widget.dataModel['CustomerFullName'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.0, color: Colors.blue[200]),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      //----------------------------------------------------------Row Start<
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dataModel['Idno'],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Id Customer',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dataModel['Spouse_Name'] ?? '',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Spouse Name',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                    ),
                    Row(
                      //----------------------------------------------------------Row Start<
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dataModel['BirthPlace'] +
                                    ', ' +
                                    _formattedDate(
                                        widget.dataModel['BirthofDate']),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'DOB',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dataModel['EmergencyContactName'],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Emergency Contact Name',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                    ),
                    Row(
                      //----------------------------------------------------------Row Start<
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dataModel['Religion'],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Agama',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dataModel['CompanyName'],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Company Name',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                    ),
                    Text(
                      _addressSelected??'',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child:InkWell(
                              child: Text('Residence',
                              style: TextStyle(
                                color: Colors.lightBlueAccent
                              ),),
                              onTap: _selectAddressResidence,
                            )
                        ),
                        Expanded(
                            child:InkWell(
                              child: Text('Legal',
                                style: TextStyle(
                                    color: Colors.lightBlueAccent
                                ),),
                              onTap: _selectAddressLegal,
                            )
                        ),
                        Expanded(
                            child:InkWell(
                              child: Text('Company',
                                style: TextStyle(
                                    color: Colors.lightBlueAccent
                                ),),
                              onTap: _selectAddressCompany,
                            )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.3,
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
          //Text(locations.toString())
        ],
      ),
    );
  }
}
