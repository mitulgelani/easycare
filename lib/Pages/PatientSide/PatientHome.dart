import 'dart:ui';
import 'package:easycare/Pages/PatientSide/healthcareprovider/healthcare_provider_1.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Patient Name',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text('Easycare Id: 89898998',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text('Joined Date : 8 June 2021',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white)),
                              ],
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                width: MediaQuery.of(context).size.width * 0.24,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100)),
                                child: LineIcon(LineIcons.qrcode, size: 75))
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(
                                20) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.9),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HealthcareProvider_1()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            height: MediaQuery.of(context).size.height * 0.19,
                            width: MediaQuery.of(context).size.width * 0.28,
                            child: Align(
                                alignment: Alignment(0.2, -0.5),
                                child: Column(
                                  children: [
                                    LineIcon(LineIcons.stethoscope,
                                        size: 90, color: Colors.blue[400]),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.015),
                                    Text('HealthCare \n  Provider',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700))
                                  ],
                                )),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          height: MediaQuery.of(context).size.height * 0.19,
                          width: MediaQuery.of(context).size.width * 0.28,
                          child: Align(
                              alignment: Alignment(0.2, -0.5),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.009),
                                  LineIcon(LineIcons.medicalBook,
                                      size: 90, color: Colors.blue[400]),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.024),
                                  Text('Medicine',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700))
                                ],
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          height: MediaQuery.of(context).size.height * 0.19,
                          width: MediaQuery.of(context).size.width * 0.28,
                          child: Align(
                              alignment: Alignment(0.2, -0.5),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.009),
                                  LineIcon(LineIcons.microscope,
                                      size: 90, color: Colors.blue[400]),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.019),
                                  Text('Laborateries',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700))
                                ],
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top * 0.5,
                              left: 20),
                          child: Text(
                            'Upcoming Appoinments',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top * 0.5,
                                left: 70),
                            child: Text(
                              'view all',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue[400]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top * 1,
                      ),
                      height: MediaQuery.of(context).size.height * 0.12,
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
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width: 80.0,
                                        fit: BoxFit.cover)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          top: MediaQuery.of(context)
                                                  .padding
                                                  .top *
                                              0.4),
                                      child: Text(
                                        '20 sep- 2021 - 3:00 pm',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          top: MediaQuery.of(context)
                                                  .padding
                                                  .top *
                                              0.3),
                                      child: Text(
                                        'Dr. Nathan Roy',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          top: MediaQuery.of(context)
                                                  .padding
                                                  .top *
                                              0.4),
                                      child: Text(
                                        'Care Consultation',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.blue[400],
                                            fontWeight: FontWeight.w700),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top * 0.5,
                      ),
                      height: MediaQuery.of(context).size.height * 0.12,
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
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width: 80.0,
                                        fit: BoxFit.cover)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          top: MediaQuery.of(context)
                                                  .padding
                                                  .top *
                                              0.4),
                                      child: Text(
                                        '20 sep- 2021 - 3:00 pm',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          top: MediaQuery.of(context)
                                                  .padding
                                                  .top *
                                              0.3),
                                      child: Text(
                                        'Dr. Nathan Roy',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          top: MediaQuery.of(context)
                                                  .padding
                                                  .top *
                                              0.4),
                                      child: Text(
                                        'Care Consultation',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.blue[400],
                                            fontWeight: FontWeight.w700),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top * 0.5,
                      ),
                      height: MediaQuery.of(context).size.height * 0.12,
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
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width: 80.0,
                                        fit: BoxFit.cover)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          top: MediaQuery.of(context)
                                                  .padding
                                                  .top *
                                              0.4),
                                      child: Text(
                                        '20 sep- 2021 - 3:00 pm',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          top: MediaQuery.of(context)
                                                  .padding
                                                  .top *
                                              0.3),
                                      child: Text(
                                        'Dr. Nathan Roy',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          top: MediaQuery.of(context)
                                                  .padding
                                                  .top *
                                              0.4),
                                      child: Text(
                                        'Care Consultation',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.blue[400],
                                            fontWeight: FontWeight.w700),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
