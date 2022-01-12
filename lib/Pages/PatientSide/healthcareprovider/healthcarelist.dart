import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top * 0.5,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top * 0.5,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Healthcare Provider',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).padding.top * 0.6,
                  left: MediaQuery.of(context).padding.top * 0.6,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Material(
                        elevation: 5,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: /* Text(
                            '   Healthcare',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ), */
                                Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Icon(Icons.search,
                                    size: MediaQuery.of(context).size.width *
                                        0.07),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  'Search hear...',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.13,
                      child: Material(
                        elevation: 5,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.format_align_left_sharp)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).padding.top * 0.6,
                    ),
                    child: Text(
                      "Top Healthcare Provider",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                /*  Padding(
                          padding: EdgeInsets.only(
                left: MediaQuery.of(context).padding.top * 0.6,
                          ),
                          child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: Material(
                      elevation: 5,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.01,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /*  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.01,
                                  ), */
                            Container(
                              /*    height:
                                        MediaQuery.of(context).size.height * 0.13,
                                    width:
                                        MediaQuery.of(context).size.width * 0.24, */
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset('Assets/person.jpg',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.135,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.004,
                            ),
                            Text("Doctor Name",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.001,
                            ),
                            Text("MBBS, FCP",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.001,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.022,
                                  decoration: BoxDecoration(
                                    color: Colors.green, //orange //grey //red
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .padding
                                                    .top *
                                                0.25),
                                        child: Text(
                                          '4', //Pending //Completed //Canceled
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.007,
                                      ),
                                      Container(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            LineIcons.starAlt,
                                            size: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.017,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.010),
                                Text(
                                  '152 Review',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
                          ),
                        ), */
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).padding.top * 0.6,
                          bottom: MediaQuery.of(context).padding.top * 0.32,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.22,
                            width: MediaQuery.of(context).size.width * 0.28,
                            child: Material(
                                elevation: 5,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.01,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      /*  SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height * 0.01,
                                      ), */
                                      Container(
                                        /*    height:
                                            MediaQuery.of(context).size.height * 0.13,
                                        width:
                                            MediaQuery.of(context).size.width * 0.24, */
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.asset(
                                                'Assets/person.jpg',
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.135,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.12,
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.004,
                                      ),
                                      Text("Doctor Name",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                      ),
                                      Text("MBBS, FCP",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.022,
                                            decoration: BoxDecoration(
                                              color: Colors
                                                  .green, //orange //grey //red
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .padding
                                                                  .top *
                                                              0.25),
                                                  child: Text(
                                                    '4', //Pending //Completed //Canceled
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.007,
                                                ),
                                                Container(
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      LineIcons.starAlt,
                                                      size: 10,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.017,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.010),
                                          Text(
                                            '152 Review',
                                            style: TextStyle(fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        /*    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppointmentDetails())); */
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.03,
                          right: MediaQuery.of(context).size.width * 0.03,
                          bottom: MediaQuery.of(context).size.width * 0.03,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top * 0,
                          ),
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(10),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).padding.top *
                                        0.02,
                                    left: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.asset(
                                              'Assets/person.jpg',
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.21,
                                              fit: BoxFit.cover)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.007),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
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
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.003),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
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
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.015),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                top: MediaQuery.of(context)
                                                        .padding
                                                        .top *
                                                    0.3),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.028,
                                                  decoration: BoxDecoration(
                                                    color: Colors
                                                        .green, //orange //grey //red
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.025,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.only(
                                                            left: MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .top *
                                                                0),
                                                        child: Text(
                                                          '4', //Pending //Completed //Canceled
                                                          style: TextStyle(
                                                              fontSize: 13.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.007,
                                                      ),
                                                      Container(
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Icon(
                                                            LineIcons.starAlt,
                                                            size: 12,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.017,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.012),
                                                Text(
                                                  '152 Review',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
