import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup_namer/resource/values/app_colors.dart';
import 'package:startup_namer/view_models/appointment_viewmodel.dart';
import 'package:startup_namer/widgets/appbar_widget.dart';

class AppointmentView extends StatefulWidget {
  @override
  _AppointmentViewState createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime.now();

  @override
  void initState() {
    this.getData();
    super.initState();
  }

  List data = new List();

  void getData() {
    AppointmentViewModel().fetchAppointment().then((value) {
      for (var i =0; i < value.length; i++){

      }
      data = value;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(now.year, now.month),
        lastDate: DateTime(now.year, now.month + 3, now.day + 30 - now.day));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        mainTitle: 'Appointment',
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              child: Icon(
                                CupertinoIcons.calendar,
                                color: Colors.green,
                                size: 50,
                              ),
                              onTap: () => _selectDate(context),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              now.year.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            Text(
                              'Mon, 2 Nov',
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 2,
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                              AppColors.DARK_BLUE,
                              Colors.green
                            ])))),
                  ],
                )),
          ),
          Expanded(
            flex: 7,
            child: AppointmentListWidget(
              data: data,
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentListWidget extends StatelessWidget {
  const AppointmentListWidget({
    this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 1),
            child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                      Colors.blue,
                      Colors.green,
                    ])),
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'From ',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Text(
                            data[index]['_timeFrom'],
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' To ',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Text(
                            data[index]['_timeTo'],
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Attandee: ',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Text(
                            data[index]['_attandee'],
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Location: ',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Text(
                            data[index]['_location'],
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Notes: ',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        data[index]['_notes'],
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
