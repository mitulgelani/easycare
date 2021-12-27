import 'dart:async';
import 'package:easycare/Pages/Authenticitypages/loginpage.dart';
import 'package:easycare/Pages/defaultpage.dart';
import 'package:easycare/pref/shared_pref.dart';
import 'package:easycare/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'Pages/Authenticitypages/Tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await SharedPref.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        "/": (context) => SplashScreen(),
        "/login": (context) => LoginScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SessionManager prefs = SessionManager();

  @override
  void initState() {
    Future<String> authToken = prefs.getAuthToken('loginflag');
    Future<String> authphone = prefs.getAuthToken('phone');
    authToken.then((data) {
      print("authToken " + data.toString() + authphone.toString());
    }, onError: (e) {
      print(e);
    });
    Timer(Duration(seconds: 3), () {
      /*    Navigator.of(context).pushReplacementNamed(SharedPref.isLogin ? AppRoute.mainScreen : AppRoute.loginScreen); */
      authToken.then(
        (data) {
          if (data.toString() != '1') {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DefaultPage()));
          } else {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    TaskPage(context, phone: authphone.toString())));
          }

          print("authToken " + data.toString());
        },
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Hello There!'));
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int doneflagu = 0;
//   int doneflaga = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder<FirebaseUser>(
//       future: FirebaseAuth.instance.currentUser(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           FirebaseUser? user = snapshot.data;
//           return TaskPage(uid: user.uid);
//         } else {
//           return DefaultPage();
//         }
//       },
//     ));
//   }
// }
