import 'package:easycare/Pages/PatientSide/healthcareprovider/doctor/urgent/urgenthome.dart';
import 'package:easycare/Pages/PatientSide/healthcareprovider/urgent_nonurgent.dart';
import 'package:flutter/material.dart';

class DoctorHome extends StatefulWidget {
  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
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
                            fontSize: 27,
                          )),
                      Text("Devid Miller",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 1.0,
                        ),
                        child: Text("What doctor would you like to see?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.top * 0.0,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: doctor_types.length,
                          itemBuilder: (context, i) {
                            return Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top * 1.0,
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UrgentNonUrgent(
                                                        category:
                                                            '${doctor_types[i]}')));
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${doctor_types[i]}",
                                            //overflow: TextOverflow.ellipsis,
                                            maxLines: null,
                                            style: TextStyle(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 17.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                  ],
                                )
                                /*  : // Container()
                                    InkWell(
                                        onTap: () {
                                          print("page urgent");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UrgentHome()));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              //  color: Colors.blue[400],
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.blue[400],
                                              ),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "${doctor_types[i]}",
                                                  //overflow: TextOverflow.ellipsis,
                                                  maxLines: null,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    // fontWeight: FontWeight.w600,
                                                    fontSize: 17.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1,
                                            ),
                                          ],
                                        ),
                                      ) */
                                );
                          }),

                      /*  tapflagu == 0
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      print("*******u********");
                                      tapflagu = 1;
                                      tapflagnu = 0;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                          border: Border.all(
                                       width: 1,
                                          color: Colors.black,
                                        ), 
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.blue[400],
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height * 0.07,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Urgent care",
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
                                    print("page urgent");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UrgentHome()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      /*  border: Border.all(
                                width: 1,
                                color: Colors.black,
                                ), */
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue[400],
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height * 0.07,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Urgent care",
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
                          tapflagnu == 0
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      print("*******nu********");
                                      tapflagu = 0;
                                      tapflagnu = 1;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      /*  border: Border.all(
                                width: 1,
                                color: Colors.black,
                                ), */
                                      borderRadius: BorderRadius.circular(10),
                                      //color: Colors.white
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height * 0.07,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Not urgent care",
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
                                    print("########Page nu ########");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        /*  border: Border.all(
                                width: 1,
                                color: Colors.black,
                                ), */
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue[400]),
                                    height:
                                        MediaQuery.of(context).size.height * 0.07,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Not urgent care",
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
                          ), */
                    ],
                  ),
                )
              ])),
    ));
  }
}
