import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easycare/profile/medical/allergies/allergies_home.dart';
import 'package:easycare/profile/personal/blood_group.dart';
import 'package:easycare/profile/personal/dateofbirth.dart';
import 'package:easycare/profile/personal/gender.dart';
import 'package:easycare/profile/personal/marital_status.dart';
import 'package:easycare/shared_pref.dart';
import 'package:flutter/material.dart';

import 'medical/occupation.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal>
    with SingleTickerProviderStateMixin {
  CollectionReference users = FirebaseFirestore.instance.collection('patient');
  TextEditingController hc = TextEditingController();
  TextEditingController wc = TextEditingController();
  TextEditingController cc = TextEditingController();
  Future<void> updateUser() {
    return users
        .doc('$phone')
        .update({'height': height, 'weight': weight, 'mobileno': mobileno});
  }

  late String phone = '',
      name = '',
      email = '',
      height = '',
      weight = '',
      mobileno = '',
      gender = '',
      dob = '',
      bloodgroup = '';
  SessionManager prefs = SessionManager();
  late Future<String> authphone;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
    authphone = prefs.getAuthToken('phone');
    authphone.then((val) {
      phone = val;
      getdata();
    });
    setState(() {
      phone;
      name;
      email;
      height;
      weight;
      mobileno;
      gender;
      dob;
      bloodgroup;
    });
  }

  Future getdata() async {
    await FirebaseFirestore.instance
        .collection('patient')
        .doc(phone)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          name = documentSnapshot['firstname'] +
              ' ' +
              documentSnapshot['lastname'];
          email = documentSnapshot['email'];
          gender = documentSnapshot['gender'];
          dob = documentSnapshot['dob'];
          bloodgroup = documentSnapshot['bloodgroup'];
          height = documentSnapshot['height'];
          weight = documentSnapshot['weight'];
          mobileno = documentSnapshot['mobileno'];
          hc.text = height;
          wc.text = weight;
          cc.text = mobileno;
        });
      }
    });
  }

  Widget personal() {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        children: <Widget>[
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 4),
            //  MediaQuery.of(context).padding.bottom * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          '$name',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Stack(
                    alignment: const Alignment(-2, 1.5),
                    children: <Widget>[
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Icon(Icons
                                .account_box_rounded) /*  Image.asset(
                                        'assets/careprovider.png',
                                        fit: BoxFit.cover,
                                      ), */
                            ),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          color: Colors.blue[400],

                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 3,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Mobile Number",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$phone",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Email Address",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$email",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Gender(phone: phone)));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      gender != null
                          ? Text(
                              "$gender",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              "add gender",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.bold),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DoB(phone: phone)));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Date Of Birth",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      dob != null
                          ? Text(
                              "$dob",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              "dd-mm-yyyy",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.bold),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BloodGroup(phone: phone)));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Blood Groop",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      bloodgroup != null
                          ? Text(
                              "$bloodgroup",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              "add blood groop",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.bold),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                "Height",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextFormField(
                    controller: hc,
                    onChanged: (val) {
                      height = val;
                    },
                    decoration: InputDecoration(
                      hintText: 'ex. 6"7\'',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )),
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).padding.top * 0.8,
              right: MediaQuery.of(context).padding.top * 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Weight",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextFormField(
                      controller: wc,
                      onChanged: (val) {
                        weight = val;
                      },
                      decoration: InputDecoration(
                        hintText: 'ex. 68 Kgs',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).padding.top * 0.8,
              right: MediaQuery.of(context).padding.top * 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Emergency Contact",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                      controller: cc,
                      onChanged: (val) {
                        mobileno = val;
                      },
                      decoration: InputDecoration(
                        hintText: 'ex. +91 8980135476',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
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
              },
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.blue, width: 1.5, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(7)),
            ),
          ),
        ],
      ),
    ));
  }

  Widget medical() {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        children: <Widget>[
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Allergies_Home()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Allergies",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "No",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Occupation()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Current Medications",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "add medications",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Occupation()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Past Medications",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "add details",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Occupation()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Chronic Disease",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "add disease",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Occupation()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Injuries",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "add injuries",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Occupation()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Surgeries",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "add surgeries",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Occupation()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Smoking Habits",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "add details",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Occupation()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Alcohol Consumption",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "add details",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Occupation()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Activity Level",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "add details",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Occupation()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Food Preference",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "add lifestyle",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Occupation()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Occupation",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "add occupation",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget test_report() {
    return SingleChildScrollView(
        child: Center(child: Column(children: <Widget>[])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () {
        return getdata();
      },
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top * 1.5),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.blue[400],
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            TabBar(
              tabs: [
                Container(
                  height: 30,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Personal',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Medical',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Test Report',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
              indicatorPadding: EdgeInsets.only(left: 10, right: 10),
              indicatorWeight: 3.0,
              indicatorColor: Colors.blue[400],
              unselectedLabelColor: Colors.grey[600],
              labelColor: Colors.black,
              controller: _tabController,
            ),
            Expanded(
              child: TabBarView(
                children: [personal(), medical(), test_report()],
                controller: _tabController,
              ),
            ),
          ])),
    ));
  }
}
