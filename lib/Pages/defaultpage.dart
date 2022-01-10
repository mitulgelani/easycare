import 'package:easycare/Pages/Authenticitypages/SignupScreen.dart';
import 'package:easycare/Pages/Authenticitypages/Tasks.dart';
import 'package:easycare/Pages/Authenticitypages/authentication.dart';
import 'package:easycare/Pages/Authenticitypages/loginpage.dart';
import 'package:easycare/Pages/Authenticitypages/signup.dart';
import 'package:easycare/Pages/DoctorAuthencitypages/loginpage.dart';
import 'package:easycare/Pages/DoctorAuthencitypages/signup.dart';
import 'package:easycare/profile/profiletask.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  int doneflagu = 0;
  int doneflaga = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'Assets/newlogo.PNG',
                height: 150.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Text(
                "Choose Your Identity",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          doneflagu = 1;
                          doneflaga = 0;
                        });
                      },
                      child: Container(
                        child: Stack(
                          alignment: const Alignment(0.9, -0.9),
                          children: <Widget>[
                            /*   CircleAvatar(
                          backgroundImage: AssetImage("assets/logo.jpeg"),
                          radius: 90.0,
                        ), */
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Image.asset('Assets/careseeker.png',
                                  height: 90, width: 90),
                            ),
                            doneflagu == 1
                                ? Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      // shape: BoxShape.circle,
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Icon(
                                      Icons.done,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Care Seeker",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          doneflaga = 1;
                          doneflagu = 0;
                        });
                      },
                      child: Container(
                        child: Stack(
                          alignment: const Alignment(0.8, -0.9),
                          children: <Widget>[
                            /*   CircleAvatar(
                          backgroundImage: AssetImage("assets/logo.jpeg"),
                          radius: 90.0,
                        ), */
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'Assets/careprovider.png',
                                height: 145.0,
                                width: 145.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            doneflaga == 1
                                ? Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      // shape: BoxShape.circle,
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Icon(
                                      Icons.done,
                                      size: 22,
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Care Provider",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
            doneflaga == 1 || doneflagu == 1
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: RaisedButton(
                          textColor: Colors.black,
                          color: Colors.white,
                          child: Text("Login"),
                          onPressed: () {
                            if (doneflagu == 1)
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DoctorLoginScreen()));
                            }
                          },
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),

                        /*  RaisedButton(
                   
                    onPressed: () {},
                    color: Colors.white,
                    child: Text('Login'),
                  ), */
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.black,
                          child: Text("SignUp"),
                          onPressed: () {
                            if (doneflagu == 1)
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                            else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DoctorSignUpScreen()));
                            }
                          },
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                      )
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
