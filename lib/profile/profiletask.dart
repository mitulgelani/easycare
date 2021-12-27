import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cupertino_icons/cupertino_icons.dart';

import 'e_personal.dart';

class ProfileTaskPage extends StatefulWidget {
  final String uid;
  const ProfileTaskPage({Key? key, required this.uid}) : super(key: key);

  @override
  _ProfileTaskPageState createState() => _ProfileTaskPageState(uid);
}

class _ProfileTaskPageState extends State<ProfileTaskPage> {
  final String uid;
  _ProfileTaskPageState(this.uid);

  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  List<String> entries = <String>[
    'My Wallet',
    'Order History',
    'Order Tracking',
    'My Favorite',
    'Manage Address',
    'Madicine Reminder',
    'Settings',
    'Support',
    'Logout',
  ];

  static const icons = <IconData>[
    Icons.account_balance_wallet_rounded,
    Icons.history_edu,
    Icons.not_listed_location,
    Icons.favorite_outline,
    Icons.edit_location_sharp,
    Icons.medication_rounded,
    Icons.settings,
    Icons.support_agent,
    Icons.logout_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              /*  ListTile(
                minLeadingWidth: 0,
                minVerticalPadding: 20,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  //or 15.0
                  child: Container(
                    height: 80.0,
                    width: 55.0,
                    color: Colors.grey[200],
                    child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.account_balance_wallet_rounded,
                          color: Colors.lightBlue[300],
                        )),
                  ),
                ),
                title: Text(
                  'My Wallet',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  /*  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SecondPage())); */
                },
              ), */

              /* Container(
                  height: MediaQuery.of(context).size.height * 0.24,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.lightBlue[300],
                  child: // Align(alignment: Alignment.center, child: Text('Well')),
                      Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "My Account",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 50.0,
                              width: 50.0,
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.blue[100],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.notifications_none_sharp,
                                    color: Colors.black,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )), */
              Stack(
                alignment: const Alignment(-0.8, 1.8),
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.lightBlue[300],
                      child: // Align(alignment: Alignment.center, child: Text('Well')),
                          Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "My Account",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: 50.0,
                                  width: 50.0,
                                  // color: Colors.white,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 0.5,
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.notifications_none_sharp,
                                        color: Colors.black,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  /*   Row(children: <Widget>[
                    Align(
                      alignment: const Alignment(-0.5, 1),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.orange[400],
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
///////
                  ]), */
                  Container(
                    // height: 90,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Personal()));
                            },
                            child: Icon(
                              Icons.account_box,
                              size: 90,
                              color: Colors.orange[400],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              color: Colors.orange[400],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              icon: new Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.white,
                              ),
                              tooltip: 'edit Profile',
                              onPressed: () {
                                print('go fast');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Personal()));
                              },
                            ),

                            /*  GestureDetector(
                              onTap: () {
                                print('go');
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Personal()));
                              },
                              child: Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.white,
                              ),
                            ), */
                          ),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      65, MediaQuery.of(context).padding.top * 1.7, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Ruturaj Rahul",
                        style: TextStyle(
                            fontSize: 27.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ms_taapsee@indianteam.csk",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "+33 1937 873 342 ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: entries.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          minLeadingWidth: 0,
                          minVerticalPadding: 20,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            //or 15.0
                            child: Container(
                              height: 80.0,
                              width: 55.0,
                              color: Colors.grey[200],
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    icons[i],
                                    /*  Icons.account_balance_wallet_rounded, */
                                    color: Colors.lightBlue[300],
                                  )),
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${entries[i]}',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey[400],
                              )
                            ],
                          ),
                          onTap: () {
                            /*  Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => SecondPage())); */
                          },
                        ),
                        /*  Divider(
                          color: Colors.grey[200],
                        ) */
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
