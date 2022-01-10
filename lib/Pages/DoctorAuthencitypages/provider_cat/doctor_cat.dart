import 'package:easycare/Pages/Authenticitypages/SignupScreen.dart';
import 'package:easycare/Pages/DoctorAuthencitypages/SignupScreen.dart';
import 'package:flutter/material.dart';

class Doctor_Cat extends StatefulWidget {
  final String category;
  final String phone;
  Doctor_Cat({Key? key, required this.category, required this.phone}) : super(key: key);

  @override
  _Doctor_CatState createState() => _Doctor_CatState(category,phone);
}

class _Doctor_CatState extends State<Doctor_Cat> {
  final String category;
  final String phone;

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

  _Doctor_CatState(this.category, this.phone);
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
                                                    DoctorSignUpScreenPage(
                                                      category:
                                                          '${doctor_types[i]}',
                                                      phone: phone,
                                                      uid: '',
                                                      Provider_type: 'doctor',
                                                    )));
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
                                ));
                          }),
                    ],
                  ),
                )
              ])),
    ));
  }
}
