import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easycare/Pages/PatientSide/healthcareprovider/doctordetails.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class DoctorList extends StatefulWidget {
  final String category, time;
  const DoctorList({Key? key, required this.category, required this.time})
      : super(key: key);

  @override
  _DoctorListState createState() => _DoctorListState(category, time);
}

class _DoctorListState extends State<DoctorList> {
  final String category, time;
  List<Map<String, dynamic>> doclist = [];

  _DoctorListState(this.category, this.time);
  Future getdata() async {
    print('$category $time');
    bool tmpflag;
    if (time == 'Urgent Care') {
      tmpflag = true;
    } else {
      tmpflag = false;
    }
    await FirebaseFirestore.instance
        .collection('doctor')
        .where('category', isEqualTo: '$category')
        .where('urgentflag', isEqualTo: tmpflag)
        .get()
        .then((snapshot) {
      doclist.clear();
      snapshot.docs.forEach((doc) {
        setState(() {
          doclist.add(doc.data());
          print(doc.data()['mobile']);
        });
      });
    });
    return;
  }

  initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Icon(Icons.search,
                                  size:
                                      MediaQuery.of(context).size.width * 0.07),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                'Search here...',
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  itemCount: doclist.length,
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
                                    Text("${doclist[i]['fullname']}",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.001,
                                    ),
                                    Text("${doclist[i]['fieldcourse']}",
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
                                                    left: MediaQuery.of(context)
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
                itemCount: doclist.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DoctorDetails(doclist: doclist[i])));
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
                                  top:
                                      MediaQuery.of(context).padding.top * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18)),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.asset('Assets/person.jpg',
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
                                            '${doclist[i]['fullname']}',
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
                                            '${doclist[i]['fieldcourse']}',
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
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
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
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
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
                                                      width:
                                                          MediaQuery.of(context)
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
                                                      0.012),
                                              Text(
                                                '152 Review',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
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
    ));
  }
}
