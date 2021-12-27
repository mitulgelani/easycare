import 'package:easycare/Pages/PatientSide/healthcareprovider/nurse/nurse2.dart';
import 'package:flutter/material.dart';

class NursesHome extends StatefulWidget {
  const NursesHome({Key? key}) : super(key: key);

  @override
  _NursesHomeState createState() => _NursesHomeState();
}

class _NursesHomeState extends State<NursesHome> {
  List<String> nurse_types = <String>[
    "Any",
    "General Nurse",
    "Midwife",
    "Community Health Worker",
    "Plastic Nurse",
    "Trauma Nurse",
    "ICU Nurse",
    "PERIOP NURSING",
    "ANAESTHETIC NURSE",
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
                          itemCount: nurse_types.length,
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
                                                builder: (context) => Nurse2(
                                                    category:
                                                        '${nurse_types[i]}')));
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
                                            "${nurse_types[i]}",
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
