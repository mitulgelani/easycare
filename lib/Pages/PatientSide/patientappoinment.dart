import 'package:flutter/material.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({Key? key}) : super(key: key);

  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Expanded(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Stack(
                  children: [
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blue[400],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).padding.top *
                                          0.8),
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
                                        "Video Consultation",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).padding.top *
                                          1.0,
                                      right:
                                          MediaQuery.of(context).padding.top *
                                              1.0,
                                      top: MediaQuery.of(context).padding.top *
                                          1),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "12 Jan, 2022,",
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.035,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2, color: Colors.white),
                                          color: Colors
                                              .green, //orange //grey //red
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .padding
                                                    .top *
                                                0.5,
                                            right: MediaQuery.of(context)
                                                    .padding
                                                    .top *
                                                0.5,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'Confirm', //Pending //Completed //Canceled
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).padding.top *
                                                1.0,
                                        right:
                                            MediaQuery.of(context).padding.top *
                                                1.0,
                                        top:
                                            MediaQuery.of(context).padding.top *
                                                0.3),
                                    child: Text(
                                      "3:30 PM",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ]),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).padding.top * 1.3,
                        top: MediaQuery.of(context).padding.top * 8.6,
                      ),
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 5, color: Colors.white24),
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('Assets/granny.jpg'),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).padding.top * 5.8,
                          top: MediaQuery.of(context).padding.top * 9.3,
                        ),
                        /*  height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.2, */
                        decoration: BoxDecoration(
                            color: Colors.blue[400],
                            border: Border.all(width: 2.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).padding.top * 0.5),
                          child: Icon(
                            Icons.message_rounded,
                            color: Colors.white,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).padding.top * 8.5,
                          top: MediaQuery.of(context).padding.top * 9.3,
                        ),
                        /*  height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.2, */
                        decoration: BoxDecoration(
                            color: Colors.orange[400],
                            border: Border.all(width: 2.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).padding.top * 0.5),
                          child: Icon(
                            Icons.videocam,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).padding.top * 1.2,
                      right: MediaQuery.of(context).padding.top * 1.2,
                      top: MediaQuery.of(context).padding.top * 0.8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Dr. Nathan Fox",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Text(
                          "MBBS BCS (Medicine)",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Flexible(
                                  child: Text(
                                      "124 E 3rd Ave, rajkotaznhvnn, AK, 95004 ")),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).padding.top * 1.0,
                                right: MediaQuery.of(context).padding.top * 0,
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: Colors.blue[400],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).padding.top *
                                        0.5,
                                    right: MediaQuery.of(context).padding.top *
                                        0.5,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Get Directions',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.027,
                ),
                Divider(
                  thickness: 3.5,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).padding.top * 1.2,
                      right: MediaQuery.of(context).padding.top * 1.2,
                      top: MediaQuery.of(context).padding.top * 0.3),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "patient details",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.person_outline,
                              color: Colors.grey[600],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.040,
                            ),
                            Text(
                              "Devid Anderson",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.male_rounded,
                              color: Colors.grey[600],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.040,
                            ),
                            Text(
                              "26, Male",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone_android_outlined,
                              color: Colors.grey[600],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.040,
                            ),
                            Text(
                              "+33 9574 345 745",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.mail_outlined,
                              color: Colors.grey[600],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.040,
                            ),
                            Text(
                              "devid_anderson07@gmail.com",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).padding.top * 1.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(thickness: 1),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Text(
                        "Reason for doctor visit",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Text(
                        "Reason for doctor visit, Reason for doctor visitReason for doctor visit",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.065,
                ),
              ])),
        ),
//////
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Material(
              elevation: 20,
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
                      color: Colors.grey, //blue[400]
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      child: Text(
                        "Reschedule", //Review the doctor
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
//////
      ],
    ));
  }
}