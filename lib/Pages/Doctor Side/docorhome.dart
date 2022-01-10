import 'package:easycare/Pages/Doctor%20Side/docAppointment.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class DocHomePage extends StatefulWidget {
  const DocHomePage({Key? key}) : super(key: key);

  @override
  _DocHomePageState createState() => _DocHomePageState();
}

class _DocHomePageState extends State<DocHomePage> {
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
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          height: MediaQuery.of(context).size.height * 0.14,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 7),
                                child: LineIcon(Icons.person,
                                    color: Colors.red, size: 35),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 8),
                                  child: Text(
                                    'Appoinments',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 8),
                                  child: Text(
                                    '80',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: MediaQuery.of(context).size.height * 0.14,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 7),
                                child: LineIcon(Icons.account_balance,
                                    color: Colors.green[400], size: 35),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 8),
                                  child: Text(
                                    'Monthly Earnings',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 8),
                                  child: Text(
                                    '\$99999',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top * 0.5,
                              left: 20),
                          child: Text(
                            'Appoinments Requests',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top * 0.5,
                                left: 100),
                            child: Icon(
                              Icons.menu,
                              color: Colors.blue[400],
                            )),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.048,
                                  width:
                                      MediaQuery.of(context).size.width * 0.68,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.zero,
                                      bottomRight: Radius.zero,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Icon(
                                            Icons.place,
                                            color: Colors.white,
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            'Pakistan',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                      ),
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.asset(
                                              'Assets/person.jpg',
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              fit: BoxFit.cover)),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                'Jacob Roy',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              )),
                                          Container(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                'Homecare',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.09),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.14,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.black),
                                          child: Center(
                                            child: Text(
                                              'Urgent',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 0.0, top: 10),
                                      child: RaisedButton(
                                        textColor: Colors.white,
                                        color: Colors.blue[400],
                                        child: Text("Accept"),
                                        onPressed: () {},
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 75.0, right: 0.0, top: 10),
                                      child: RaisedButton(
                                        textColor: Colors.white,
                                        color: Colors.grey[500],
                                        child: Text("Decline"),
                                        onPressed: () {},
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
/*                     Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                    leading: Icon(Icons.list),
                                    trailing: Text(
                                      "GFG",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 15),
                                    ),
                                    title: Text("List item $index"));
                              }),
                        ),
                      ), /* Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.048,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.zero,
                                      bottomRight: Radius.zero,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Icon(
                                            Icons.place,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        
                        ],
                      ), */
                    ), */
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top * 0.5,
                              left: 20),
                          child: Text(
                            'Next Appoinments',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AppointmentRequest()));
                      },
                      child: Container(
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          width: 68.0,
                                          fit: BoxFit.cover)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              fontSize: 16,
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
                                              fontSize: 13,
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
                                                0.32),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.025,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.26,
                                        decoration: BoxDecoration(
                                            color: Colors.blue[400],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            'Upcoming',
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18)),
                      ),
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
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width: 68.0,
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
                                            fontSize: 16,
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
                                            fontSize: 13,
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
                                              0.32),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.025,
                                      width: MediaQuery.of(context).size.width *
                                          0.26,
                                      decoration: BoxDecoration(
                                          color: Colors.green[300],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Text(
                                          'In Progress',
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
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
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width: 68.0,
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
                                            fontSize: 16,
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
                                            fontSize: 13,
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
                                              0.32),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.025,
                                      width: MediaQuery.of(context).size.width *
                                          0.26,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[400],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Text(
                                          'Upcoming',
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
