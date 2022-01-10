import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easycare/Pages/Authenticitypages/Tasks.dart';
import 'package:easycare/Pages/Authenticitypages/otp.dart';
import 'package:easycare/Pages/Authenticitypages/signup.dart';
import 'package:easycare/Pages/DoctorAuthencitypages/Tasks.dart';
import 'package:easycare/Pages/PatientSide/PatientHome.dart';
import 'package:easycare/Pages/defaultpage.dart';
import 'package:easycare/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'authentication.dart';

class DoctorLoginScreen extends StatefulWidget {
  @override
  _DoctorLoginScreenState createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<DoctorLoginScreen> {
  late String email = '';
  late String password = '';
  late String cc = '';
  var maptmp;
  late List<DocumentSnapshot> doc;
  SessionManager prefs = SessionManager();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future getdata() async {
    /* final Future<DocumentSnapshot> document = FirebaseFirestore.instance
        .collection('users')
        .doc('${cc}${email}')
        .get();

    await document.then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() async {
        maptmp = snapshot.data();
        password = maptmp['password'];
        print(password);
        print(password);
        print(password);
        print(password);
        print(password);
      });
    }); */

    FirebaseFirestore.instance
        .collection('doctor')
        .doc('$cc$email')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (password == documentSnapshot['password']) {
          prefs.setAuthToken('docloginflag', '1');
          prefs.setAuthToken('docphone', '$cc$email');
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DoctorTaskPage(
                        context,
                        phone: '$cc$email',
                      )));
        }
      } else {
        Fluttertoast.showToast(
            msg: "Invalid Username or Password!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue[300],
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  /*  Future<dynamic> getdata() async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .doc('${cc}${email}')
        .collection('history')
        .get();
    doc = result.docs;
    var document = await FirebaseFirestore.instance
        .collection('COLLECTION_NAME')
        .doc('TESTID1')
        .get();
  
    // ignore: unnecessary_statements
  }
 */
  void login() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      getdata();
      getdata();
      getdata();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // ignore: deprecated_member_use
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
            ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset('Assets/newlogo.PNG',
                    height: 120.0, width: 120.0, fit: BoxFit.cover)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Doctor Side",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          hoverColor: Colors.grey,
                          prefixIcon: CountryCodePicker(
                            onChanged: (val) {
                              cc = '';
                              cc = val.dialCode!;
                            },
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'IT',
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            favorite: ['+91', 'IN'],
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                            borderSide: new BorderSide(),
                          ),
                          hintText: "Mobile No."),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "This Field Is Required"),
                      ]),
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey,
                            prefixIcon: Icon(Icons.lock, color: Colors.grey),
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
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.87,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: RaisedButton(
                        onPressed: login,
                        color: Colors.blueAccent[200],
                        textColor: Colors.white,
                        child: Text(
                          "Login",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*     MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () => googleSignIn().whenComplete(() async {
                FirebaseUser user = await FirebaseAuth.instance.currentUser();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => TaskPage(uid: user.uid)));
              }),
              child: Image(
                image: AssetImage('assets/signin.png'),
                width: 200.0,
              ),
            ), */
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).padding.top * 12),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do you have account?",
                    ),
                    Text(
                      "SignUp",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
