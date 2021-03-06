import 'package:country_code_picker/country_code_picker.dart';
import 'package:easycare/Pages/Authenticitypages/loginpage.dart';
import 'package:easycare/Pages/Authenticitypages/otp.dart';
import 'package:easycare/Pages/DoctorAuthencitypages/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'Tasks.dart';
import 'authentication.dart';

class DoctorSignUpScreen extends StatefulWidget {
  @override
  _DoctorSignUpScreenState createState() => _DoctorSignUpScreenState();
}

class _DoctorSignUpScreenState extends State<DoctorSignUpScreen> {
  late String email = '';
  late String cc = '';
  late String password = '';
  TextEditingController mobilecon = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void handleSignup() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();

      print("${cc}${mobilecon.text}");
      /*  FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "${cc}${mobilecon.text}",
        verificationCompleted: (AuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, [resendToken]) {
          print(verificationId);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(
                  
                ),
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      ); */
      /*  Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TaskPage(uid: ''),
          )); */
                      
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorOTPScreen(phone: "$cc${mobilecon.text}"),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Doctor Side",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Registration",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Please Enter your phone number.you will get 6 digit code via SMS.",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top * 1,
              ),
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: mobilecon,
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
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
                        email = '';
                        email = val;
                        print(email);
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 0.9),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.87,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: handleSignup,
                        color: Colors.blueAccent[200],
                        textColor: Colors.white,
                        child: Text(
                          "Send OTP",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
