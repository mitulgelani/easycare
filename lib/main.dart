import 'package:easycare/Pages/defaultpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Pages/Authenticitypages/Tasks.dart';

void main() {
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int doneflagu = 0;
  int doneflaga = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          FirebaseUser? user = snapshot.data;
          return TaskPage(uid: user.uid);
        } else {
          return DefaultPage();
        }
      },
    ));
  }
}
