import 'package:easycare/Pages/PatientSide/healthcareprovider/Massage%20Therapist/massagetherapist.dart';
import 'package:easycare/Pages/PatientSide/healthcareprovider/doctor/doctorhome.dart';
import 'package:easycare/Pages/PatientSide/healthcareprovider/nurse/nurse_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HealthcareProvider_1 extends StatefulWidget {
  const HealthcareProvider_1({Key? key}) : super(key: key);
  @override
  _HealthcareProvider_1State createState() => _HealthcareProvider_1State();
}

class _HealthcareProvider_1State extends State<HealthcareProvider_1> {
  int tapflagd = 0;
  int tapflagn = 0;
  int tapflagmt = 0;
  int tapflagpt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).padding.top * 1.2,
            right: MediaQuery.of(context).padding.top * 1.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top * 1.2,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          //left: MediaQuery.of(context).padding.top * 1.2,
                          top: MediaQuery.of(context).padding.top * 1.2,
                          right: MediaQuery.of(context).padding.top * 0.5),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.12,
                        // color: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top * 1.2,
                        //right: MediaQuery.of(context).padding.top * 1.2
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Healthcare Provider',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top * 1.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("welcome",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      )),
                  Text("Devid Miller",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top * 1.0,
                    ),
                    child: Text("What care do you like?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.top * 1.0,
                  ),
                  tapflagd == 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              tapflagd = 1;
                              tapflagn = 0;
                              tapflagmt = 0;
                              tapflagpt = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Align(
                                alignment: Alignment.center,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Doctor",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.done_rounded,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DoctorHome(provider: 'doctor')));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[400],
                            ),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Align(
                                alignment: Alignment.center,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Doctor",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.done_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  Divider(
                    thickness: 1,
                  ),
                  tapflagn == 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              print("*******n********");
                              tapflagd = 0;
                              tapflagn = 1;
                              tapflagmt = 0;
                              tapflagpt = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Align(
                                alignment: Alignment.center,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Nurse",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.done_rounded,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NursesHome()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[400]),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Align(
                                alignment: Alignment.center,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Nurses",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.done_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  Divider(
                    thickness: 1,
                  ),
                  tapflagmt == 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              tapflagd = 0;
                              tapflagn = 0;
                              tapflagmt = 1;
                              tapflagpt = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //color: Colors.white
                            ),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Align(
                                alignment: Alignment.center,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Massage Therapist",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.done_rounded,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        massageTherapistHome()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                /*  border: Border.all(
                              width: 1,
                              color: Colors.black,
                              ), */
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[400]),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Align(
                                alignment: Alignment.center,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Massage Therapist",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.done_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  Divider(
                    thickness: 1,
                  ),
                  tapflagpt == 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              tapflagd = 0;
                              tapflagn = 0;
                              tapflagmt = 0;
                              tapflagpt = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //color: Colors.white
                            ),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Align(
                                alignment: Alignment.center,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Physiotherapist",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.done_rounded,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        massageTherapistHome()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[400]),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Align(
                                alignment: Alignment.center,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Physiotherapist",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.done_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  Divider(
                    thickness: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
