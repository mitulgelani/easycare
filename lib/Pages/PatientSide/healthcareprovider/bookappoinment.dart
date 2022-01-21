import 'package:easycare/Pages/PatientSide/healthcareprovider/calender.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppointment extends StatefulWidget {
  Map<String, dynamic> doclist;
  final String date;
  BookAppointment({Key? key, required this.doclist, required this.date})
      : super(key: key);

  @override
  _BookAppointmentState createState() => _BookAppointmentState(doclist, date);
}

class _BookAppointmentState extends State<BookAppointment> {
  int bookflag = 0;
  final String date;

  TextEditingController name = TextEditingController();
  TextEditingController mn = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController reason = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();

  bool fsomeone = false;
  // late DateTime ? _selectedDay;
  // late DateTime _focusedDay;
  // late CalendarFormat _calendarFormat;

  // CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String day = "";
  Map<String, dynamic> doclist;

  _BookAppointmentState(this.doclist, this.date);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height * 0.27,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue[400],
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top * 1.5),
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Book Appointment",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Care Consultation",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.13),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset('Assets/person.jpg',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.11,
                                      width: MediaQuery.of(context).size.width *
                                          0.21,
                                      fit: BoxFit.cover)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.000),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        top:
                                            MediaQuery.of(context).padding.top *
                                                0.0),
                                    child: Text(
                                      'Dr. Nathan Fox',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        //fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.000),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        top:
                                            MediaQuery.of(context).padding.top *
                                                0.0),
                                    child: Text(
                                      'MBBS, BCS',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        top:
                                            MediaQuery.of(context).padding.top *
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
                                                BorderRadius.circular(100),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.030,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .padding
                                                            .top *
                                                        0),
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
                                                    0.006,
                                              ),
                                              Container(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    LineIcons.starAlt,
                                                    size: 11,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.011),
                                        Text(
                                          '152 Review',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )),
                ]),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.06,
                      right: MediaQuery.of(context).size.width * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Date & Time',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.blue,
                                      width: 2,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        Calender(doclist: doclist)));
                              },

                              /*  onPressed: () {
                                /////////////////
                                // CalendarFormat ? _calendarFormat;
                                var _calendarFormat;
                                /*   DateTime? _selectedDay;
                                DateTime? _focusedDay; */
                                var _selectedDay;
                                var _focusedDay;
                                print('!!!!!!!!!!!!!!');
                                print(_selectedDay);
                                print('!!!!!!!!!!!!!!');
                                print(_focusedDay);
                                showMaterialModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  context: context,
                                  builder: (context) => Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                            child: Text(
                                              "Select Appointment Time", //Review the doctor
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.010),
                                        TableCalendar(
                                          firstDay: DateTime.utc(2022, 1, 19),
                                          lastDay: DateTime.utc(2022, 2, 19),
                                          focusedDay: _selectedDay,
                                          /* == null
                                              ? DateTime.now()
                                              : _selectedDay, */
                                          selectedDayPredicate: (day) {
                                            return isSameDay(_selectedDay, day);
                                          },
                                          onDaySelected:
                                              (selectedDay, focusedDay) {
                                            setState(() {
                                              _selectedDay = selectedDay;
                                              _focusedDay =
                                                  focusedDay; // update `_focusedDay` here as well

                                              print("++++++++++++++++++++");
                                              print(_selectedDay);
                                              print('-------------------');
                                              print(_focusedDay);
                                            });
                                          },

                                          /*  calendarFormat: _calendarFormat,
                                          onFormatChanged: (format) {
                                            setState(() {
                                              _calendarFormat = format;
                                            });
                                          },*/
                                          onPageChanged: (focusedDay) {
                                            setState(() {
                                              _focusedDay = focusedDay;
                                              print(_focusedDay);
                                            });
                                          },
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.07,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: FlatButton(
                                                  color: Colors.blue[400],
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  onPressed: () {
                                                    showMaterialModalBottomSheet(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        context: context,
                                                        builder: (context) =>
                                                            Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.7,
                                                                child: Column(
                                                                    children: [
                                                                      SizedBox(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.025),
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
                                                                          child:
                                                                              Text(
                                                                            "Select Appointment Time", //Review the doctor
                                                                            style: TextStyle(
                                                                                fontSize: 17,
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.w600),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.010),
                                                                    ])));
                                                  },
                                                  child: Text(
                                                    "Apply", //Review the doctor
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );

///////////////////////
                              }, */
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Select Appointment Time", //Review the doctor
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[400],
                                      fontWeight: FontWeight.w700),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Text(
                        'Selected Appointment Date : $date',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      fsomeone == true
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Patient Details',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015),
                                TextFormField(
                                  controller: name,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey,
                                      prefixIcon: LineIcon(
                                          Icons.person_outline_rounded,
                                          color: Colors.grey),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0),
                                        borderSide: new BorderSide(),
                                      ),
                                      hintText: 'Full Name'),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "name Is Required"),
                                  ]),
                                  onChanged: (val) {},
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.020),
                                TextFormField(
                                  controller: mn,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey,
                                      prefixIcon: LineIcon(LineIcons.phone,
                                          color: Colors.grey),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0),
                                        borderSide: new BorderSide(),
                                      ),
                                      hintText: 'Mobile Number'),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "Password Is Required"),
                                    MinLengthValidator(10,
                                        errorText: "Only 10 Characters"),
                                  ]),
                                  onChanged: (val) {},
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.020),
                                TextFormField(
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey,
                                      prefixIcon: LineIcon(Icons.email_outlined,
                                          color: Colors.grey),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0),
                                        borderSide: new BorderSide(),
                                      ),
                                      hintText: 'Email Address'),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "email Is Required"),
                                  ]),
                                  onChanged: (val) {},
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.020),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: TextFormField(
                                        controller: gender,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            fillColor: Colors.grey,
                                            prefixIcon: LineIcon(
                                                Icons.male_rounded,
                                                color: Colors.grey),
                                            border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      15.0),
                                              borderSide: new BorderSide(),
                                            ),
                                            hintText: 'Gender'),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "Gender Is Required"),
                                        ]),
                                        onChanged: (val) {},
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.040),
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        controller: age,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            fillColor: Colors.grey,
                                            /*   prefixIcon: LineIcon(
                                                Icons.hiking_sharp,
                                                color: Colors.grey), */
                                            border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      15.0),
                                              borderSide: new BorderSide(),
                                            ),
                                            hintText: 'Age(Yrs)'),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "Age Is Required"),
                                        ]),
                                        onChanged: (val) {},
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.020),
                                TextFormField(
                                  controller: address,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey,
                                      prefixIcon: LineIcon(Icons.location_on,
                                          color: Colors.grey),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0),
                                        borderSide: new BorderSide(),
                                      ),
                                      hintText: 'Address'),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "email Is Required"),
                                  ]),
                                  onChanged: (val) {},
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.020),
                                TextFormField(
                                  controller: city,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey,
                                      prefixIcon: LineIcon(
                                          Icons.location_city_rounded,
                                          color: Colors.grey),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0),
                                        borderSide: new BorderSide(),
                                      ),
                                      hintText: 'City'),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "City Is Required"),
                                  ]),
                                  onChanged: (val) {},
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.020),
                              ],
                            )
                          : Container(),
                      TextFormField(
                        controller: reason,
                        maxLines: null,
                        minLines: 3,
                        //keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            fillColor: Colors.grey,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'please state reason for doctor visit'),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Password Is Required"),
                        ]),
                        onChanged: (val) {},
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: FlatButton(
                                color: Colors.blue[400],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  if (fsomeone == true) {
                                    setState(() {
                                      fsomeone = false;
                                    });
                                  } else {
                                    print("completed");
                                    /*   Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AppointmentTime())); */
                                  }
                                },
                                child: Text(
                                  "Book Appointment", //Review the doctor
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width,
                              child: bookflag == 0
                                  ? FlatButton(
                                      color: Colors.blue[400],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      onPressed: () {
                                        setState(() {
                                          fsomeone = true;
                                          bookflag = 1;
                                        });
                                        /*   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BookAppointment())); */
                                      },
                                      child: Text(
                                        "Book for someone else", //Review the doctor
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))
                                  : FlatButton(
                                      color: Colors.blue[400],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      onPressed: () {
                                        setState(() {
                                          fsomeone = false;
                                          bookflag = 0;
                                        });
                                        /*   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BookAppointment())); */
                                      },
                                      child: Text(
                                        "Book for yourself", //Review the doctor
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                    ],
                  ),
                ),
              ]))),
          /*    Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Material(
                elevation: 20,
                shadowColor: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).padding.top * 1.0,
                    top: MediaQuery.of(context).padding.top * 0.5,
                    right: MediaQuery.of(context).padding.top * 1.0,
                    bottom: MediaQuery.of(context).padding.top * 0.5,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                        color: Colors.blue[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookAppointment()));
                        },
                        child: Text(
                          "Book Appointment", //Review the doctor
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ),
            ),
          ), */
        ],
      ),
    );
  }
}
