import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DoB extends StatefulWidget {
  final String phone;

  const DoB({Key? key, required this.phone}) : super(key: key);

  @override
  _DoBState createState() => _DoBState(phone);
}

class _DoBState extends State<DoB> {
  late String date = "";
  DateTime selectedDate = DateTime.now();
  final String phone;
  CollectionReference users = FirebaseFirestore.instance.collection('patient');

  Future<void> updateUser() {
    return users.doc('$phone').update({'dob': date});
  }

  _DoBState(this.phone);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1910),
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Birthdate',
      fieldHintText: 'mm/dd/yy',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var formatDate = new DateFormat('dd/MM/yyyy');
        date = formatDate.format(selectedDate);
      });
    updateUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
      Container(
          height: MediaQuery.of(context).size.height * 0.32,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue[400],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top * 1.2),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Prsonal",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).padding.top * 1.9,
                      right: MediaQuery.of(context).padding.top * 1.9,
                      top: MediaQuery.of(context).padding.top * 1.5),
                  child: Text(
                    "When is your birthday?",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
      Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).padding.top * 1.9,
            right: MediaQuery.of(context).padding.top * 1.9,
            top: MediaQuery.of(context).padding.top * 1.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            date == ""
                ? Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    // "$date",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                : Text(
                    //"${selectedDate.toLocal()}".split(' ')[0],
                    "$date",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).padding.top * 1.9,
            right: MediaQuery.of(context).padding.top * 1.9,
            top: MediaQuery.of(context).padding.top * 1.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text("Choose date"),
            ),
          ],
        ),
      ),
    ])));
  }
}
