import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:startup_namer/widgets/appbar_widget.dart';

class AttendanceView extends StatefulWidget {
  static const String routeName = '/attendance';

  @override
  _AttendanceViewState createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  String _timeStr;
  Timer _timerNow;
  bool _isButtonInDisabled;
  bool _isButtonOutDisabled;

  //------------------------------------------Current Time-------------------------------------------

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('kk:mm:ss').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeStr = formattedDateTime;
    });
  }

  @override
  void initState() {
    _isButtonInDisabled = true;
    _isButtonOutDisabled = false;
    _timeStr = _formatDateTime(DateTime.now());
    _timerNow = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  void dispose() {
    _timerNow.cancel();
    _timerSubscription.cancel();
    super.dispose();
  }

  //------------------------------------------Duration-------------------------------------------
  bool flag = true;
  Stream<int> _timerStream;
  StreamSubscription<int> _timerSubscription;
  String _hoursStr = '00';
  String _minutesStr = '00';
  String _secondsStr = '00';

  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
      if (!flag) {
        stopTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  //------------------------------------------Clock In-------------------------------------------
  String _clockIn = '- - : - - : - -';
  String _clockOut = '- - : - - : - -';

  void _setClockIn() {
    setState(() {
      _clockIn = _timeStr;
      _isButtonInDisabled = false;
      _isButtonOutDisabled = true;
      _timerStream = stopWatchStream();
      _timerSubscription = _timerStream.listen((int newTick) {
        setState(() {
          _hoursStr =
              ((newTick / (60 * 60)) % 60).floor().toString().padLeft(2, '0');
          _minutesStr =
              ((newTick / 60) % 60).floor().toString().padLeft(2, '0');
          _secondsStr = (newTick % 60).floor().toString().padLeft(2, '0');
        });
      });
    });
  }

  void _setClockOut() {
    setState(() {
      _timerSubscription.cancel();
      _clockOut = _timeStr;
      _isButtonOutDisabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(mainTitle: 'Attendance'),
      body: SingleChildScrollView (
      child : Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment(0, -1),
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  margin: EdgeInsets.fromLTRB(0, 108, 0, 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(color: Colors.blue[600], spreadRadius: 1)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16, 130, 16, 16),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            DateFormat('EEE, d MMM yyyy')
                                .format(DateTime.now()),
                            style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                        ),
                        Center(
                          child: Text(
                            _timeStr,
                            style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Clock In',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                _clockIn,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Clock Out',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                _clockOut,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Text(
                            'Working Time:',
                            style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(top:8, bottom: 4),
                        ),
                        Center(
                          child: Text(
                            '$_hoursStr:$_minutesStr:$_secondsStr',
                            style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 140,
                              height: 100,
                              child: RaisedButton(
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset('assets/images/clockin.png',
                                          height: 50, fit: BoxFit.fill),
                                      Text('Clock In',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ))
                                    ]),
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                textColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                elevation: 10.0,
                                splashColor: Colors.white70,
                                onPressed:
                                    _isButtonInDisabled ? _setClockIn : null,
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              height: 100,
                              child: RaisedButton(
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/clockout.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                      Text('Clock Out',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ))
                                    ]),
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                textColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                elevation: 10.0,
                                splashColor: Colors.white70,
                                onPressed:
                                    _isButtonOutDisabled ? _setClockOut : null,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(top: 16),
                  alignment: Alignment(0.0, 0.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.blue[600], spreadRadius: 1)
                      ],
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/bg.png'),
                      )),
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: Colors.blue[200],
                    size: 64,
                  ))
            ],
          ),
        ],
      ),
    ));
  }
}
