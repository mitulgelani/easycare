import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easycare/Pages/Doctor%20Side/timeavailability.dart';
import 'package:flutter/material.dart';

class SessionTime extends StatefulWidget {
  late int day;
  final String phone;
  SessionTime({Key? key, required this.day, required this.phone})
      : super(key: key);
  @override
  _SessionTimeState createState() => _SessionTimeState(day, phone);
}

class _SessionTimeState extends State<SessionTime> {
  late int day;
  final String phone;
  dynamic timeavailability;

  initState() {
    super.initState();
    CollectionReference users = FirebaseFirestore.instance.collection('doctor');
    users.doc(phone).get().then((data) {
      timeavailability = data['timeavailability'];
      print('time availability ---> $timeavailability');
    });
  }

  List<Map<String, dynamic>> daytime = [];
  _SessionTimeState(this.day, this.phone);

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: Container());
      },
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTime2 = TimeOfDay.now();

  bool fromflag = false;
  bool toflag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Add Session Time',
            style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios,
                  size: 28, color: Colors.blue[400])),
        ),
        body: Stack(
          children: [
            Expanded(
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.030,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06,
                    right: MediaQuery.of(context).size.width * 0.06,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              fromflag = true;
                              toflag = false;
                            });
                            _selectTime(BuildContext context) async {
                              final TimeOfDay? timeOfDay = await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                                initialEntryMode: TimePickerEntryMode.dial,
                              );
                              if (timeOfDay != null &&
                                  timeOfDay != selectedTime) {
                                setState(() {
                                  selectedTime = timeOfDay;
                                });
                              }
                            }

                            _selectTime(context);
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "FROM",
                                  style: TextStyle(
                                    color: fromflag
                                        ? Colors.blue[400]
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.007,
                                ),
                                Text(
                                  selectedTime.format(context),
                                  style: TextStyle(
                                    color: fromflag
                                        ? Colors.blue[400]
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              fromflag = false;
                              toflag = true;
                            });
                            _selectTime(BuildContext context) async {
                              final TimeOfDay? timeOfDay = await showTimePicker(
                                context: context,
                                initialTime: selectedTime2,
                                initialEntryMode: TimePickerEntryMode.dial,
                              );
                              if (timeOfDay != null &&
                                  timeOfDay != selectedTime2) {
                                setState(() {
                                  selectedTime2 = timeOfDay;
                                });
                              }
                            }

                            _selectTime(context);
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "TO",
                                  style: TextStyle(
                                    color:
                                        toflag ? Colors.blue[400] : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.007,
                                ),
                                Text(
                                  "${selectedTime2.format(context)}",
                                  style: TextStyle(
                                    color: toflag
                                        ? Colors.blue[400]
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      /*  Container(
                          child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'FROM',
                          style: TextStyle(color: Colors.blue[400]),
                        ),
                      )), */
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                //Text("jdfhfkdhihgisnlsdnmlm"),
              ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Material(
                  elevation: 10,
                  shadowColor: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).padding.top * 1.0,
                      top: MediaQuery.of(context).padding.top * 0.5,
                      right: MediaQuery.of(context).padding.top * 1.0,
                      bottom: MediaQuery.of(context).padding.top * 0.5,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                          color: Colors.blue[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            timeavailability.insert(
                                day,
                                ({
                                  selectedTime.format(context).toString():
                                      selectedTime2.format(context).toString()
                                }));

                            CollectionReference users =
                                FirebaseFirestore.instance.collection('doctor');
                            print(timeavailability);

                            users
                                // existing document in 'users' collection: "ABC123"
                                .doc(phone)
                                .update(
                              {'timeavailability': timeavailability},
                            );
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Save", //Review the doctor
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
