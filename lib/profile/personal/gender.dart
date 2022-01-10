import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  final String phone;
  const Gender({Key? key, required this.phone}) : super(key: key);

  @override
  _GenderState createState() => _GenderState(phone);
}

class _GenderState extends State<Gender> {
  @override
  late String gender;
  int tapflag = 0;
  int tapflag1 = 0;
  int tapflag2 = 0;
  int tapflag3 = 0;
  final String phone;
  CollectionReference users = FirebaseFirestore.instance.collection('patient');

  Future<void> updateUser() {
    return users.doc('$phone').update({'gender': gender});
  }

  _GenderState(this.phone);

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
                          "Which gender do you identify with?",
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
                  tapflag1 == 1
                      ? FlatButton(
                          textColor: Colors.white,
                          color: Colors.blue[400],
                          child: Text(
                            "Male",
                            style: TextStyle(fontSize: 13),
                          ),
                          onPressed: () {
                            setState(() {
                              tapflag = 1;

                              tapflag1 = 1;
                              tapflag2 = 0;
                              tapflag3 = 0;
                              gender = 'Male';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(7)),
                        )
                      : FlatButton(
                          textColor: Colors.black,
                          color: Colors.white,
                          child: Text(
                            "Male",
                            style: TextStyle(fontSize: 13),
                          ),
                          onPressed: () {
                            setState(() {
                              tapflag = 1;

                              tapflag1 = 1;
                              tapflag2 = 0;
                              tapflag3 = 0;
                              gender = 'Male';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                  tapflag2 == 1
                      ? FlatButton(
                          textColor: Colors.white,
                          color: Colors.blue[400],
                          child: Text(
                            "Female",
                            style: TextStyle(fontSize: 13),
                          ),
                          onPressed: () {
                            setState(() {
                              tapflag = 1;

                              tapflag1 = 0;
                              tapflag2 = 1;
                              tapflag3 = 0;
                              gender = 'Female';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(7)),
                        )
                      : FlatButton(
                          textColor: Colors.black,
                          color: Colors.white,
                          child: Text(
                            "Female",
                            style: TextStyle(fontSize: 13),
                          ),
                          onPressed: () {
                            setState(() {
                              tapflag = 1;

                              tapflag1 = 0;
                              tapflag2 = 1;
                              tapflag3 = 0;
                              gender = 'Female';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                  tapflag3 == 1
                      ? FlatButton(
                          textColor: Colors.white,
                          color: Colors.blue[400],
                          child: Text(
                            "Other",
                            style: TextStyle(fontSize: 13),
                          ),
                          onPressed: () {
                            setState(() {
                              tapflag = 1;

                              tapflag1 = 0;
                              tapflag2 = 0;
                              tapflag3 = 1;
                              gender = 'Other';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(7)),
                        )
                      : FlatButton(
                          textColor: Colors.black,
                          color: Colors.white,
                          child: Text(
                            "Other",
                            style: TextStyle(fontSize: 13),
                          ),
                          onPressed: () {
                            setState(() {
                              tapflag = 1;
                              tapflag1 = 0;
                              tapflag2 = 0;
                              tapflag3 = 1;
                              gender = 'Other';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                ],
              ),
            ),
            tapflag == 1
                ? Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top * 14.0),
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
                              print(gender);
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
