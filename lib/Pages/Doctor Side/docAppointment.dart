import 'package:flutter/material.dart';

class AppointmentRequest extends StatefulWidget {
  const AppointmentRequest({Key? key}) : super(key: key);

  @override
  _AppointmentRequestState createState() => _AppointmentRequestState();
}

class _AppointmentRequestState extends State<AppointmentRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                                top: MediaQuery.of(context).padding.top * 0.8),
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
                                  "Appointment Request",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold
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
                                      MediaQuery.of(context).padding.top * 1.0,
                                  right:
                                      MediaQuery.of(context).padding.top * 1.0,
                                  top: MediaQuery.of(context).padding.top * 1),
                              child: Text(
                                "12 Jan 2022,",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).padding.top * 1.0,
                                  right:
                                      MediaQuery.of(context).padding.top * 1.0,
                                  top:
                                      MediaQuery.of(context).padding.top * 0.3),
                              child: Text(
                                "2pm-3pm",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                /*  Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).padding.top * 0.8,
                        right: MediaQuery.of(context).padding.top * 0.8,
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02),
                          Row(
                            children: <Widget>[],
                          )
                        ],
                      ),
                    ), */
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
                top: MediaQuery.of(context).padding.top * 0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Teri H. Hass",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.035,
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).padding.top * 0.5,
                            right: MediaQuery.of(context).padding.top * 0.5,
                            /*  top: MediaQuery.of(context).padding.top * 0.3,
                  bottom: MediaQuery.of(context).padding.top * 0.3 */
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Upcoming',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Consultation type",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Text(
                          "Home care",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.035,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).padding.top * 0.5,
                          right: MediaQuery.of(context).padding.top * 0.5,
                          /*  top: MediaQuery.of(context).padding.top * 0.3,
                              bottom: MediaQuery.of(context).padding.top * 0.3 */
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Urgent',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Text(
                  "Mobile Number",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Text(
                  "+1 034 5067 890",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Text(
                  "Email Address",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Text(
                  "peter.spider@gmail.com",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Text(
                  "Reason for doctor visit",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Text(
                  "Hello Dr. Steve\nmy aknaefdpo kdmfvcbazsxd sodljdkndmdb jsdkjdb",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Text(
                  "Address",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Text(
                  "Hello Dr. Steve\nmy aknaefdddffvcbdd",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                FlatButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {},
                    child: Text(
                      "Get Directions",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                /*  Container(
                  /*  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).padding.top * 1.3,
                    top: MediaQuery.of(context).padding.top * 8.6,
                  ), */
                  height: MediaQuery.of(context).size.height * 1.2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 5, color: Colors.white24),
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('Assets/granny.jpg'),
                  ),
                ), */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: FlatButton(
                          color: Colors.blue[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {},
                          child: Text(
                            "Accept",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: FlatButton(
                          color: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {},
                          child: Text(
                            "Decline",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                      color: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      child: Text(
                        "Reschedule",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                      color: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      child: Text(
                        "Start Consultation",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                      color: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      child: Text(
                        "Start Journey",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}