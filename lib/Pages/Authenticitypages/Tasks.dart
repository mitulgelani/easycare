import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  final String uid;

  const TaskPage({Key? key, required this.uid}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState(uid);
}

class _TaskPageState extends State<TaskPage> {
  final String uid;
  _TaskPageState(this.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
