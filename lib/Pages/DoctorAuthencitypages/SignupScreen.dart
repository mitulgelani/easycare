// ignore_for_file: deprecated_member_use
import 'package:easycare/Pages/Authenticitypages/Tasks.dart';
import 'package:easycare/Pages/DoctorAuthencitypages/Tasks.dart';
import 'package:easycare/Pages/DoctorAuthencitypages/loginpage.dart';
import 'package:easycare/Pages/DoctorAuthencitypages/signupstep2.dart';
import 'package:easycare/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorSignUpScreenPage extends StatefulWidget {
  final String uid;
  final String phone;
  final String category;
  final String Provider_type;
  const DoctorSignUpScreenPage(
      {Key? key,
      required this.uid,
      required this.phone,
      required this.category,
      required this.Provider_type})
      : super(key: key);

  @override
  _DoctorSignUpScreenPageState createState() =>
      _DoctorSignUpScreenPageState(uid, phone, category, Provider_type);
}

class _DoctorSignUpScreenPageState extends State<DoctorSignUpScreenPage> {
  SessionManager prefs = SessionManager();

  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  final String uid;
  final String phone;
  final String category;
  final String Provider_type;

  _DoctorSignUpScreenPageState(
      this.uid, this.phone, this.category, this.Provider_type);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Align(
                alignment: Alignment(-0.9, 0.1),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.14,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  // ignore: deprecated_member_use
                  child: new FlatButton(
                    textColor: Colors.black,
                    child: Icon(Icons.arrow_back_ios_new_outlined),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 26, top: 20),
                child: Text(
                  'Doctor Side',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 26, top: 20),
                child: Text(
                  'Welcome To EasyCare',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26, top: 20),
                    child: Text(
                      'Already have an Account?',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorLoginScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 7),
                      child: Text(
                        'Logging in',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue[400]),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top * 1,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset('Assets/granny.jpg',
                              height: MediaQuery.of(context).size.height * 0.13,
                              width: MediaQuery.of(context).size.width * 0.28,
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 3.78,
                          left: 74),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.10,
                      decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(40)),
                      child:
                          Icon(Icons.camera_alt, size: 25, color: Colors.white),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: TextFormField(
                  controller: c1,
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      prefixIcon: LineIcon(Icons.person_outline_rounded,
                          color: Colors.grey),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(),
                      ),
                      hintText: 'First Name'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Password Is Required"),
                    MinLengthValidator(6,
                        errorText: "Minimum 6 Characters Required"),
                  ]),
                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: TextFormField(
                  controller: c2,
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      prefixIcon: Icon(Icons.panorama_vertical_select_outlined,
                          color: Colors.grey),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(),
                      ),
                      hintText: 'Last Name'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Password Is Required"),
                    MinLengthValidator(6,
                        errorText: "Minimum 6 Characters Required"),
                  ]),
                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: TextFormField(
                  controller: c3,
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      prefixIcon:
                          Icon(Icons.email_outlined, color: Colors.grey),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(),
                      ),
                      hintText: 'Email Address'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Password Is Required"),
                    MinLengthValidator(6,
                        errorText: "Minimum 6 Characters Required"),
                  ]),
                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: TextFormField(
                  controller: c4,
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      prefixIcon:
                          Icon(LineIcons.mobilePhone, color: Colors.grey),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(),
                      ),
                      hintText: 'Mobile No.'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Password Is Required"),
                    MinLengthValidator(6,
                        errorText: "Minimum 6 Characters Required"),
                  ]),
                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: TextFormField(
                  controller: c5,
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      prefixIcon:
                          Icon(Icons.lock_outline_rounded, color: Colors.grey),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(),
                      ),
                      hintText: 'Password'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Password Is Required"),
                    MinLengthValidator(6,
                        errorText: "Minimum 6 Characters Required"),
                  ]),
                  onChanged: (val) {},
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: new Border.all(color: Colors.white, width: 2.0),
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.only(left: 0, top: 20),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.89,
                  child: RaisedButton(
                      color: Colors.blue[400],
                      onPressed: () {
                        print('doc phone' + phone);
                        print('doc phone' + phone);
                        print('doc phone' + phone);
                        FirebaseFirestore.instance
                            .collection('doctor')
                            .doc(phone)
                            .set({
                          'firstname': c1.text,
                          'lastname': c2.text,
                          'email': c3.text,
                          'mobile': c4.text,
                          'password': c5.text,
                          'provider': Provider_type,
                          'category': category
                        });
                        prefs.setAuthToken('docloginflag', '1');
                        prefs.setAuthToken('docphone', '$phone');

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Sigupstep3(phone: phone)));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Center(
                  child: Text(
                    'By Clicking Signup you are agreeing to the\n \t\t\t\tTerms of use and the Privacy Policy',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
