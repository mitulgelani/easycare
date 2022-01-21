import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easycare/Pages/PatientSide/healthcareprovider/bookappoinment.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Calender extends StatefulWidget {
  Map<String, dynamic> doclist;
  Calender({Key? key, required this.doclist}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState(doclist);
}

class _CalenderState extends State<Calender> {
  Map<String, dynamic> doclist;

  TextEditingController name = TextEditingController();
  TextEditingController mn = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController reason = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();

  bool fsomeone = false;
  // late DateTime ? _selectedDay;
  // late DateTime _focusedDay;
  // late CalendarFormat _calendarFormat;

  // CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String day = "";

  _CalenderState(this.doclist);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          Container(
            /*  height: MediaQuery.of(context).size.height *
                                                  0.8, */
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: Text(
                      "Select Appointment Time", //Review the doctor
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.010),
                TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2099),
                  focusedDay: _focusedDay,
                  calendarFormat: CalendarFormat.month, // _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        day = _selectedDay.toString();
                        print(_selectedDay);
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    setState(() {
                      _focusedDay = focusedDay;
                    });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.04),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                          color: Colors.blue[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BookAppointment(
                                    doclist: {},
                                    date:
                                        "${_selectedDay?.day}-${_selectedDay?.month}-${_selectedDay?.year}")));
                          },
                          child: Text(
                            "Apply", //Review the doctor
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.020),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
