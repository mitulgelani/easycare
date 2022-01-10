import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BloodGroup extends StatefulWidget {
  final String phone;
  const BloodGroup({Key? key, required this.phone}) : super(key: key);

  @override
  _BloodGroupState createState() => _BloodGroupState(phone);
}

class _BloodGroupState extends State<BloodGroup> {
  // ignore: non_constant_identifier_names
  late String blood_group;
  late int A1 = 0, A2 = 0, B1 = 0, B2 = 0, O1 = 0, O2 = 0, AB1 = 0, AB2 = 0;
  int flag = 0;
  final String phone;
  CollectionReference users = FirebaseFirestore.instance.collection('patient');

  Future<void> updateUser() {
    return users.doc('$phone').update({'bloodgroup': blood_group});
  }

  _BloodGroupState(this.phone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
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
                          "What is your blood group?",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top * 1.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      A1 == 1
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.white,
                                color: Colors.blue[400],
                                child: Text(
                                  "A+",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 1;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'A+';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.black,
                                color: Colors.white,
                                child: Text(
                                  "A+",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 1;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'A+';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            ),
                      A2 == 1
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                height: 45,
                                textColor: Colors.white,
                                color: Colors.blue[400],
                                child: Text(
                                  "A+",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 1;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'A-';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.black,
                                color: Colors.white,
                                child: Text(
                                  "A-",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 1;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'A-';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            ),
                      B1 == 1
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.white,
                                color: Colors.blue[400],
                                child: Text(
                                  "B+",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 1;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'B+';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.black,
                                color: Colors.white,
                                child: Text(
                                  "B+",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 1;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'B+';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            ),
                      B2 == 1
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.white,
                                color: Colors.blue[400],
                                child: Text(
                                  "B-",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 1;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'B-';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.black,
                                color: Colors.white,
                                child: Text(
                                  "B-",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 1;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'B-';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            ),
                    ])),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top * 1.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      O1 == 1
                          ? /* Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child:  */
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.white,
                                color: Colors.blue[400],
                                child: Text(
                                  "O+",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 1;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'O+';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.black,
                                color: Colors.white,
                                child: Text(
                                  "O+",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 1;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'O+';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            ),
                      O2 == 1
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                height: 45,
                                textColor: Colors.white,
                                color: Colors.blue[400],
                                child: Text(
                                  "O-",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 1;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'O-';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.black,
                                color: Colors.white,
                                child: Text(
                                  "O-",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 1;
                                    AB1 = 0;
                                    AB2 = 0;
                                    blood_group = 'O-';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            ),
                      AB1 == 1
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.white,
                                color: Colors.blue[400],
                                child: Text(
                                  "AB+",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 1;
                                    AB2 = 0;
                                    blood_group = 'AB+';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.black,
                                color: Colors.white,
                                child: Text(
                                  "AB+",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 1;
                                    AB2 = 0;
                                    blood_group = 'AB+';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            ),
                      /* */
                    ])),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top * 1.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AB2 == 1
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.white,
                                color: Colors.blue[400],
                                child: Text(
                                  "AB-",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 1;
                                    blood_group = 'AB-';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FlatButton(
                                textColor: Colors.black,
                                color: Colors.white,
                                child: Text(
                                  "AB-",
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = 1;
                                    A1 = 0;
                                    A2 = 0;
                                    B1 = 0;
                                    B2 = 0;
                                    O1 = 0;
                                    O2 = 0;
                                    AB1 = 0;
                                    AB2 = 1;
                                    blood_group = 'AB-';
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1.5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            ),
                    ])),
            flag == 1
                ? Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top * 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.width * 0.12,
                          child: FlatButton(
                            textColor: Colors.white,
                            color: Colors.blue[400],
                            child: Text(
                              "Save",
                              style: TextStyle(fontSize: 13),
                            ),
                            onPressed: () {
                              updateUser();
                              Navigator.of(context).pop();
                              print(blood_group);
                            },
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.blue,
                                    width: 1.5,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(7)),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
