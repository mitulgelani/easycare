import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import '../../shared_pref.dart';
import '../defaultpage.dart';

class DocProfile extends StatefulWidget {
  const DocProfile({
    Key? key,
  }) : super(key: key);

  @override
  _DocProfileState createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
  late String gender = '', doctype = '';
  CollectionReference users = FirebaseFirestore.instance.collection('doctor');

  String fullname = '',
      date = '',
      normalcharge = '',
      urgentcharge = '',
      aboutme = '',
      location = '',
      university = '',
      course = '',
      exhospital = '',
      exhospitaladd = '';

  SessionManager prefs = SessionManager();
  late String phone = '';
  late String hvcharge = '', vcharge = '', ccharge = '';

  List<String> doctor_types = <String>[
    "Any",
    "GENERAL PRACTICE, Family medicine and general medical care",
    "HAEMATOLOGY, Sickle cell and blood diseases",
    "PAEDIATRICS, Child health",
    "WOMEN HEALTH, PREGNANCY AND DELIVERY (OB/GYN)",
    "CARDIOLOGY, heart, and blood pressure",
    "GASTROENTEROLOGY, ULCER AND HEPATITIS",
    "NEPHROLOGY",
    "ENDOCRINE, DIABETES AND HORMONAL DISEASES",
    "UROLOGY",
    "DERMATOLOGY, SKIN CARE",
    "GENERAL SURGERY",
    "DENTISTRY AND ORAL CARE",
    "EYE CARE (OPHTALMOLOGY)",
    "MENTAL HEALTH",
    "AVIATION MEDICINE",
    "PULMONOLOGY",
    "ORTHOPAEDICS",
    "EAR, NOSE AND THROAT (ENT)",
    "NEUROLOGY, STROKE AND NERVE DISEASES",
    "INFECTIOUS DISEASES, HIV, COVID19",
    "PLASTIC SURGERY",
    "NEUROSURGERY",
    "PAEDIATRIC SURGERY",
    "ONCOLOGY",
    "HISTOPATHOLOGY",
    "ANAESTHESIA AND PAIN MANAGEMENT",
    "COMMUNITY HEALTH, community and prevention medicine",
    "RHEUMATOLOGY",
    "CARDIOTHORACIC SURGERY",
    "ANATOMIC PATHOLOGY",
    "FORENSIC MEDICINE",
    "CHEMICAL PATHOLOGY, metabolic diseases, electrolyte imbalances",
    "CLINICAL MICROBIOLOGY, Virologists, immunologists, Parasitologists, Chronic infections",
  ];
  void initState() {
    super.initState();
    Future<String> docauthphone = prefs.getAuthToken('docphone');
    docauthphone.then((value) {
      setState(() async {
        phone = value.toString();

        await FirebaseFirestore.instance
            .collection('doctor')
            .doc(phone)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            setState(() {
              fullname = documentSnapshot['fullname'];
              date = documentSnapshot['date'];
              normalcharge = documentSnapshot['normalcharges'];
              urgentcharge = documentSnapshot['urgentcharges'];
              aboutme = documentSnapshot['aboutme'];
              location = documentSnapshot['clinicaddress'];
              university = documentSnapshot['university'];
              course = documentSnapshot['fieldcourse'];
              exhospital = documentSnapshot['exhospital'];
              exhospitaladd = documentSnapshot['exhospitaladd'];
              hvcharge = documentSnapshot['homevisitcharges'];
              vcharge = documentSnapshot['videocharges'];
              ccharge = documentSnapshot['clinicharges'];
              gender = documentSnapshot['gender'];
              doctype = documentSnapshot['doctype'];
            });
          }
        });
      });
    });
  }

  Future _showDialog4(context) async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                //your code dropdown button here
                Text(
                  'Location',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                        hintText: 'Your Clinic Address'),
                    onChanged: (val) {
                      location = val;
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: 1.0, right: 0.0, top: 10, bottom: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue[400],
                      child: Text("Save Changes"),
                      onPressed: () {
                        users.doc('$phone').update({'clinicaddress': location});
                        Navigator.of(context).pop();
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                )
              ]);
            }),
          );
        });
  }

  Future _showDialog5(context) async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                //your code dropdown button here
                Text(
                  'Education',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                        hintText: 'University'),
                    onChanged: (val) {
                      university = val;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                        hintText: 'Field Course'),
                    onChanged: (val) {
                      course = val;
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: 1.0, right: 0.0, top: 10, bottom: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue[400],
                      child: Text("Save Changes"),
                      onPressed: () {
                        users.doc(phone).update(
                            {'university': university, 'fieldcourse': course});
                        Navigator.of(context).pop();
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                )
              ]);
            }),
          );
        });
  }

  Future _showDialog7(context) async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                //your code dropdown button here
                Text(
                  'Yr. Experience',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                        hintText: 'Hospital / Clinic'),
                    onChanged: (val) {
                      exhospital = val;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                        hintText: 'Address'),
                    onChanged: (val) {
                      exhospitaladd = val;
                    },
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 1.0, right: 0.0, top: 10, bottom: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.grey,
                          child: Text("Cancel"),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 1.0, right: 0.0, top: 10, bottom: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Text("Log Out"),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ]);
            }),
          );
        });
  }

  Future _showDialog6(context) async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                //your code dropdown button here
                Text(
                  'Yr. Experience',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                        hintText: 'Hospital / Clinic'),
                    onChanged: (val) {
                      exhospital = val;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                        hintText: 'Address'),
                    onChanged: (val) {
                      exhospitaladd = val;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 1.0, right: 0.0, top: 10, bottom: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue[400],
                      child: Text("Save Changes"),
                      onPressed: () {
                        users.doc(phone).update({
                          'exhospital': exhospital,
                          'exhospitaladd': exhospitaladd
                        });
                        Navigator.of(context).pop();
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                )
              ]);
            }),
          );
        });
  }

  Future _showDialog3(context) async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                //your code dropdown button here
                Text(
                  'About Me',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    maxLines: 6,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                        hintText: 'Write about yourself...'),
                    onChanged: (val) {
                      aboutme = val;
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: 1.0, right: 0.0, top: 10, bottom: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue[400],
                      child: Text("Save Changes"),
                      onPressed: () {
                        users.doc(phone).update({'aboutme': aboutme});
                        Navigator.of(context).pop();
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                )
              ]);
            }),
          );
        });
  }

  Future _showDialog(context) async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                //your code dropdown button here
                Text(
                  'Charges',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        prefixIcon:
                            Icon(LineIcons.dollarSign, color: Colors.grey),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                        labelText: 'Home Visit Charges',
                        hintText: 'Dollars per min'),
                    onChanged: (val) {
                      hvcharge = val;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        prefixIcon:
                            Icon(LineIcons.dollarSign, color: Colors.grey),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                        labelText: 'Video Charges',
                        hintText: 'Dollars per min'),
                    onChanged: (val) {
                      vcharge = val;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        prefixIcon:
                            Icon(LineIcons.dollarSign, color: Colors.grey),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                        labelText: 'Clinic Charges',
                        hintText: 'Dollars per min'),
                    onChanged: (val) {
                      ccharge = val;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 1.0, right: 0.0, top: 10, bottom: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue[400],
                      child: Text("Save Changes"),
                      onPressed: () {
                        users.doc(phone).update({
                          'homevisitcharges': hvcharge,
                          'videocharges': vcharge,
                          'clinicharges': ccharge
                        });
                        Navigator.of(context).pop();
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                )
              ]);
            }),
          );
        });
  }

  Future _showDialog2(context) async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Expanded(
                child: SingleChildScrollView(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    //your code dropdown button here
                    Text(
                      'Personal Info',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        onChanged: (val) {
                          fullname = val;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey,
                            prefixIcon: Icon(Icons.person, color: Colors.grey),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Full Name'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        items: <String>['Male', 'Female', 'Other']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            gender = val!;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey,
                            prefixIcon: Icon(Icons.male, color: Colors.grey),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Gender'),
                      ),
                    ),

                    TextFormField(
                      onChanged: (value) {
                        date = value;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          prefixIcon: Icon(Icons.calendar_today_rounded,
                              color: Colors.grey),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                            borderSide: new BorderSide(),
                          ),
                          hintText: 'Date'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

                    DropdownButtonFormField<String>(
                      isExpanded: true,
                      items: doctor_types.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            child: Card(
                              child: Text(
                                value,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          doctype = val!;
                        });
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          prefixIcon:
                              Icon(LineIcons.doctor, color: Colors.grey),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                            borderSide: new BorderSide(),
                          ),
                          hintText: 'Doctor Type'),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                normalcharge = val;
                              },
                              decoration:
                                  InputDecoration(labelText: 'Normal Charges'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                urgentcharge = val;
                              },
                              decoration:
                                  InputDecoration(labelText: 'Urgent Charges'),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 1.0, right: 0.0, top: 10, bottom: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue[400],
                          child: Text("Save Changes"),
                          onPressed: () {
                            users.doc(phone).update({
                              'fullname': fullname,
                              'gender': gender,
                              'date': date,
                              'doctype': doctype,
                              'normalcharges': normalcharge,
                              'urgentcharges': urgentcharge
                            });
                            Navigator.of(context).pop();
                          },
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              );
            }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.blue[300],
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          'My Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              prefs.setAuthToken('docloginflag', '0');
                              prefs.setAuthToken('docphone', '');
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => DefaultPage()));
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top * 3,
                                  left:
                                      MediaQuery.of(context).padding.top * 4.8,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        10) // use instead of BorderRadius.all(Radius.circular(20))
                                    ),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: LineIcon(Icons.logout_rounded,
                                    size: MediaQuery.of(context).size.width *
                                        0.07)),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top * 1,
                              left: MediaQuery.of(context).padding.top * 0.3,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).padding.top *
                                          2,
                                      left: MediaQuery.of(context).padding.top *
                                          0.5,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            10) // use instead of BorderRadius.all(Radius.circular(20))
                                        ),
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.10,
                                    child: LineIcon(LineIcons.bell,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.07)),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).padding.top *
                                          1.7,
                                      left: MediaQuery.of(context).padding.top *
                                          1.6),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(
                                          100) // use instead of BorderRadius.all(Radius.circular(20))
                                      ),
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                  // color: Colors.blue,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    top: 170,
                  ),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                      onTap: () {
                        /*    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Personal())); */
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 5, color: Colors.white24),
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('Assets/granny.jpg')),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 60, left: 60),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 15,
                            ),
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.width * 0.06,
                            decoration: BoxDecoration(
                                color: Colors.blue[400],
                                borderRadius: BorderRadius.circular(20)),
                          )
                        ],
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0, left: 20),
                      child: Text(
                        '$fullname',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 20),
                      child: Text(
                        '$doctype',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 168.0),
                  child: GestureDetector(
                    onTap: () {
                      _showDialog2(context);
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.blue[400],
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Column(
                  children: [
                    Text(
                      'Normal',
                      style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '$normalcharge/min',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.08,
                ),
                Column(
                  children: [
                    Text(
                      'Urgent',
                      style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '$urgentcharge/min',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 10,
                thickness: 2,
              ),
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$hvcharge',
                          style: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Home Visit Charges',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$vcharge',
                          style: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: Text(
                            'Video Charges',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$ccharge',
                            style: TextStyle(
                                color: Colors.blue[400],
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'Clinic Charges',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.47),
                GestureDetector(
                  onTap: () {
                    _showDialog(context);
                  },
                  child: Icon(
                    Icons.edit,
                    size: 30,
                    color: Colors.blue[400],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 10,
                thickness: 2,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(
                        'About Me',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.59),
                    GestureDetector(
                      onTap: () {
                        _showDialog3(context);
                      },
                      child: Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.blue[400],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    '$aboutme',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 10,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.59),
                    GestureDetector(
                      onTap: () {
                        _showDialog4(context);
                      },
                      child: Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.blue[400],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.place,
                        color: Colors.grey[700],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(
                            '$location',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              color: Colors.green[500],
                              onPressed: () {},
                              child: Text(
                                'Get Directions',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 10,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(
                        'Education',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.59),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.school_rounded,
                        color: Colors.grey[700],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(
                            '$university',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(
                            '$course',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              color: Colors.green[500],
                              onPressed: () {
                                _showDialog5(context);
                              },
                              child: Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 10,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(
                        'Yr. Experience',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.47),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.api_rounded,
                        color: Colors.grey[700],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(
                            '$exhospital',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(
                            '$exhospitaladd',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              color: Colors.green[500],
                              onPressed: () {
                                _showDialog6(context);
                              },
                              child: Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
