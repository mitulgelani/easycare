import 'package:easycare/Pages/Authenticitypages/SignupScreen.dart';
import 'package:easycare/Pages/Authenticitypages/Tasks.dart';
import 'package:easycare/Pages/Authenticitypages/signup.dart';
import 'package:easycare/Pages/DoctorAuthencitypages/SignupScreen.dart';
import 'package:easycare/Pages/DoctorAuthencitypages/provider_cat/provider_cat_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class DoctorOTPScreen extends StatefulWidget {
  final String phone;
  const DoctorOTPScreen({Key? key, required this.phone});
  @override
  _DoctorOTPScreenState createState() => _DoctorOTPScreenState(phone);
}

class _DoctorOTPScreenState extends State<DoctorOTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  final String phone;

  _DoctorOTPScreenState(this.phone);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify ${phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PinPut(
              fieldsCount: 6,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 40.0,
              eachFieldHeight: 55.0,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Provider_Cat_Home(phone:phone)),
                          (route) => false);
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  _scaffoldkey.currentState!
                      // ignore: deprecated_member_use
                      .showSnackBar(SnackBar(content: Text('invalid OTP')));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '$phone',
        verificationCompleted: (credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              var user = value.user;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoctorSignUpScreenPage(
                            uid: value.user!.uid,
                            phone: phone,
                            category: '',
                            Provider_type: '',
                          )),
                  (route) => false);
            }
          });
        },
        verificationFailed: (e) {
          print(e.message);
        },
        codeSent: (verficationID, [resendToken]) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
    print('otp doc phone' + phone);
  }
}
