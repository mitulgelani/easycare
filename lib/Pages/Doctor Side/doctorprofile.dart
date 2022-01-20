import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easycare/Pages/Doctor%20Side/timeavailability.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
  late bool _isChecked = false, _ischecked2 = false;

  late bool status = false;
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
    docauthphone.then((value) async {
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
            status = documentSnapshot['urgentflag'];
          });
        }
      });
    });
  }

  Future _showDialog9(context) async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                //your code dropdown button here
                Text(
                  'Time Availability',
                  style: TextStyle(fontWeight: FontWeight.w800),
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
                        users.doc('$phone').update({});
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

  Future _showDialog8(context) async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                //your code dropdown button here
                Text(
                  'Check Availability',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CheckboxListTile(
                  title: Text('Home Consultancy'),
                  value: _isChecked,
                  onChanged: (val) {
                    setState(() {
                      _isChecked = val!;
                      if (val == true) {
                        // _currText = t;
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Clinic Consultancy'),
                  value: _ischecked2,
                  onChanged: (val) {
                    setState(() {
                      _ischecked2 = val!;
                      if (val == true) {
                        // _currText = t;
                      }
                    });
                  },
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
                        users.doc('$phone').update({
                          'homeflag': _isChecked,
                          'clinicflag': _ischecked2
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
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18),
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
                          ),
                        ],
                      )),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.30,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).padding.top * 11.1,
                      top: MediaQuery.of(context).padding.top * 8),
                  child: Material(
                    borderRadius: BorderRadius.circular(30),
                    elevation: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "Urgent",
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        FlutterSwitch(
                          width: 50.0,
                          height: 25.0,
                          valueFontSize: 25.0,
                          toggleSize: 21.0,
                          value: status,
                          borderRadius: 30.0,
                          padding: 3.0,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                              users.doc('$phone').update({'urgentflag': val});
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
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
                  padding: const EdgeInsets.only(top: 20, right: 30),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Urgent',
                      style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '+\$$urgentcharge/min',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '(Additional Charges on urgent appoinment)',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                GestureDetector(
                  onTap: () {
                    _showDialog8(context);
                  },
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                      color: Colors.blue[400],
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: new Center(
                        child: Icon(
                      LineIcons.check,
                      color: Colors.white,
                    )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Divider(
                height: 10,
                thickness: 2,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TimeAvailability(phone: phone)));
              },
              child: ListTile(
                title: Text(
                  "Time Availability",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                trailing: Wrap(
                  spacing: 12, // space between two icons
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(LineIcons.clock, size: 30),
                    ),
                    SizedBox(
                        width:
                            MediaQuery.of(context).size.width * 0.02) // icon-2
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
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
                          '\$$hvcharge /min',
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
                          '\$$vcharge /min',
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
                            '\$$ccharge /min',
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
