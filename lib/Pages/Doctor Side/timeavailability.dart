import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easycare/Pages/Doctor%20Side/addsessiontime.dart';
import 'package:flutter/material.dart';

class TimeAvailability extends StatefulWidget {
  late String phone;
  TimeAvailability({Key? key, required this.phone}) : super(key: key);

  @override
  _TimeAvailabilityState createState() => _TimeAvailabilityState(phone);
}

class _TimeAvailabilityState extends State<TimeAvailability> {
  late String phone;
  List<Map<String, dynamic>> doclist = [];

  _TimeAvailabilityState(this.phone);

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
    CollectionReference users = FirebaseFirestore.instance.collection('doctor');
    users.doc(phone).set(
      {},
    );
  }

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Time Availability',
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child:
                Icon(Icons.arrow_back_ios, size: 28, color: Colors.blue[400])),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          SizedBox(
            //  width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              // height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'MON',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SessionTime(day: 0, phone: phone)));
              },
              child: Container(
                child: Text(
                  'ADD SESSION TIME',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Divider(thickness: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'TUE',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SessionTime(day: 1, phone: phone)));
              },
              child: Container(
                child: Text(
                  'ADD SESSION TIME',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Divider(thickness: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'WED',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SessionTime(day: 2, phone: phone)));
              },
              child: Container(
                child: Text(
                  'ADD SESSION TIME',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Divider(thickness: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'THU',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SessionTime(day: 3, phone: phone)));
              },
              child: Container(
                child: Text(
                  'ADD SESSION TIME',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Divider(thickness: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'FRI',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SessionTime(day: 4, phone: phone)));
              },
              child: Container(
                child: Text(
                  'ADD SESSION TIME',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Divider(thickness: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'SAT',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SessionTime(
                              day: 5,
                              phone: phone,
                            )));
              },
              child: Container(
                child: Text(
                  'ADD SESSION TIME',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Divider(thickness: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'SUN',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SessionTime(day: 6, phone: phone)));
              },
              child: Container(
                child: Text(
                  'ADD SESSION TIME',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}



/* Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                  child: RaisedButton(
                onPressed: () {
                  _selectTime(BuildContext context) async {
                    final TimeOfDay? timeOfDay = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                      initialEntryMode: TimePickerEntryMode.dial,
                    );
                    if (timeOfDay != null && timeOfDay != selectedTime) {
                      setState(() {
                        selectedTime = timeOfDay;
                      });
                    }
                  }

                  _selectTime(context);
                },
                child: Text(
                  'ADD SESSION',
                  style: TextStyle(color: Colors.blue[400]),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: Text('to'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                  child: RaisedButton(
                onPressed: () {
                  _selectTime(BuildContext context) async {
                    final TimeOfDay? timeOfDay = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                      initialEntryMode: TimePickerEntryMode.dial,
                    );
                    if (timeOfDay != null && timeOfDay != selectedTime) {
                      setState(() {
                        selectedTime = timeOfDay;
                      });
                    }
                  }

                  _selectTime(context);
                },
                child: Text(
                  'ADD SESSION',
                  style: TextStyle(color: Colors.blue[400]),
                ),
              )),
            ) */