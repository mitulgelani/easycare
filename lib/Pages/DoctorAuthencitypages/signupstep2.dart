import 'package:easycare/Pages/DoctorAuthencitypages/Tasks.dart';
import 'package:flutter/material.dart';

class Sigupstep3 extends StatefulWidget {
  final String phone;
  Sigupstep3({
    Key? key,
    required this.phone,
  }) : super(key: key);
  @override
  _Sigupstep3State createState() => _Sigupstep3State(phone);
}

class _Sigupstep3State extends State<Sigupstep3> {
  final String phone;

  _Sigupstep3State(this.phone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).padding.top * 1.2,
                right: MediaQuery.of(context).padding.top * 1.2),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top * 1.2,
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                //left: MediaQuery.of(context).padding.top * 1.2,
                                top: MediaQuery.of(context).padding.top * 1.2,
                                right:
                                    MediaQuery.of(context).padding.top * 0.5),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.12,
                              // color: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top * 1.2),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                //right: MediaQuery.of(context).padding.top * 1.2
                                decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).padding.top *
                                          0.7,
                                      right:
                                          MediaQuery.of(context).padding.top *
                                              0.7,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Skip',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue[600]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    "Verification Center",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    "Please fill the details and attach your documents for the verification your profile",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    //right: MediaQuery.of(context).padding.top * 1.2
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).padding.top * 0.7,
                          right: MediaQuery.of(context).padding.top * 0.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Qualification certificate(s)',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.135,
                                  //right: MediaQuery.of(context).padding.top * 1.2
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: (Icon(
                                    Icons.attach_file_rounded,
                                    color: Colors.white,
                                  ))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    //right: MediaQuery.of(context).padding.top * 1.2
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).padding.top * 0.7,
                          right: MediaQuery.of(context).padding.top * 0.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Practicing licence',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.135,
                                  //right: MediaQuery.of(context).padding.top * 1.2
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: (Icon(
                                    Icons.attach_file_rounded,
                                    color: Colors.white,
                                  ))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    //right: MediaQuery.of(context).padding.top * 1.2
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).padding.top * 0.7,
                          right: MediaQuery.of(context).padding.top * 0.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Health facility certificate',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("attach");
                              },
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.135,
                                  //right: MediaQuery.of(context).padding.top * 1.2
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: (Icon(
                                    Icons.attach_file_rounded,
                                    color: Colors.white,
                                  ))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.31,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.12,
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Colors.blue[400],
                      child: Text(
                        "Continue",
                        style: TextStyle(fontSize: 13),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DoctorTaskPage(context, phone: phone)));
                      },
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.blue,
                              width: 1.5,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(7)),
                    ),
                  )
                ])));
  }
}
