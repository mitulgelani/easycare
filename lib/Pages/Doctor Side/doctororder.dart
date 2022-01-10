import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class DocOrder extends StatefulWidget {
  const DocOrder({Key? key}) : super(key: key);

  @override
  _DocOrderState createState() => _DocOrderState();
}

class _DocOrderState extends State<DocOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top * 2,
                    left: MediaQuery.of(context).padding.top * 0.8,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.asset('Assets/granny.jpg',
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top * 2,
                    left: MediaQuery.of(context).padding.top * 0.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi David!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900)),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top * 0.4),
                        child: Text('How\'r you today?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey)),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 2,
                          left: MediaQuery.of(context).padding.top * 1.7,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(
                                20) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.14,
                        child: LineIcon(LineIcons.bell,
                            size: MediaQuery.of(context).size.width * 0.10)),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 1.8,
                          left: MediaQuery.of(context).padding.top * 3.2),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(
                              100) // use instead of BorderRadius.all(Radius.circular(20))
                          ),
                      height: MediaQuery.of(context).size.height * 0.025,
                      width: MediaQuery.of(context).size.width * 0.05,
                      // color: Colors.blue,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            '80',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w900),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            'Appoinments',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            '80',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w900),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            'Completed',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          )),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            '80',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w900),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            'Cancelled',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.purple[300],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            '\$978',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w900),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            'Earnings',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top * 0.5, left: 20),
                  child: Text(
                    'Next Appoinments',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 0.5,
                          left: 160),
                      child: Icon(
                        LineIcons.filter,
                        size: 30,
                        color: Colors.grey,
                      )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top * 1,
              ),
              height: MediaQuery.of(context).size.height * 0.11,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top * 0.02,
                      left: 15,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('Assets/person.jpg',
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                width: 68.0,
                                fit: BoxFit.cover)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20,
                                  top:
                                      MediaQuery.of(context).padding.top * 0.4),
                              child: Text(
                                '20 sep- 2021 - 3:00 pm',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20,
                                  top:
                                      MediaQuery.of(context).padding.top * 0.3),
                              child: Text(
                                'Dr. Nathan Roy',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20,
                                  top: MediaQuery.of(context).padding.top *
                                      0.32),
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width * 0.26,
                              decoration: BoxDecoration(
                                  color: Colors.blue[400],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'Paid',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(18)),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top * 0.3,
              ),
              height: MediaQuery.of(context).size.height * 0.11,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top * 0.02,
                      left: 15,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('Assets/person.jpg',
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                width: 68.0,
                                fit: BoxFit.cover)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20,
                                  top:
                                      MediaQuery.of(context).padding.top * 0.4),
                              child: Text(
                                '20 sep- 2021 - 3:00 pm',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20,
                                  top:
                                      MediaQuery.of(context).padding.top * 0.3),
                              child: Text(
                                'Dr. Nathan Roy',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20,
                                  top: MediaQuery.of(context).padding.top *
                                      0.32),
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width * 0.26,
                              decoration: BoxDecoration(
                                  color: Colors.green[400],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'Pending',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(18)),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top * 0.3,
              ),
              height: MediaQuery.of(context).size.height * 0.11,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top * 0.02,
                      left: 15,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('Assets/person.jpg',
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                width: 68.0,
                                fit: BoxFit.cover)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20,
                                  top:
                                      MediaQuery.of(context).padding.top * 0.4),
                              child: Text(
                                '20 sep- 2021 - 3:00 pm',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20,
                                  top:
                                      MediaQuery.of(context).padding.top * 0.3),
                              child: Text(
                                'Dr. Nathan Roy',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20,
                                  top: MediaQuery.of(context).padding.top *
                                      0.32),
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width * 0.26,
                              decoration: BoxDecoration(
                                  color: Colors.blue[400],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'Paid',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(18)),
            ),
          ],
        ));
  }
}
