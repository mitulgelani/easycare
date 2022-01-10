import 'dart:math';

import 'package:easycare/profile/medical/allergies/add_allergies.dart';
import 'package:flutter/material.dart';

class Allergies_Home extends StatefulWidget {
  const Allergies_Home({Key? key}) : super(key: key);

  @override
  _Allergies_HomeState createState() => _Allergies_HomeState();
}

class _Allergies_HomeState extends State<Allergies_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
                        "Medical",
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
                    "Are you allergic to anything?",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 0.12,
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.white,
            child: Text(
              "No",
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.blue, width: 1.5, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(7)),
          ),
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 0.12,
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.blue[400],
            child: Text(
              "Add Allergies",
              style: TextStyle(fontSize: 13),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddAllergies()));
            },
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.blue, width: 1.5, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(7)),
          ),
        ),
      )
    ]));
  }
}
