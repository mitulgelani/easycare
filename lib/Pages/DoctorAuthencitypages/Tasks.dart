//import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:easycare/Pages/Authenticitypages/loginpage.dart';
import 'package:easycare/Pages/Authenticitypages/signup.dart';
import 'package:easycare/Pages/Doctor%20Side/docorhome.dart';
import 'package:easycare/Pages/Doctor%20Side/doctororder.dart';
import 'package:easycare/Pages/Doctor%20Side/doctorprofile.dart';
import 'package:easycare/Pages/PatientSide/PatientHome.dart';
import 'package:easycare/Pages/defaultpage.dart';
import 'package:easycare/profile/profiletask.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
//import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';
//import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

// ignore: must_be_immutable
class DoctorTaskPage extends StatefulWidget {
  String phone;
  DoctorTaskPage(BuildContext context, {Key? key, required this.phone});

  @override
  _DoctorTaskPageState createState() => _DoctorTaskPageState(phone);
}

class _DoctorTaskPageState extends State<DoctorTaskPage> {
  int _selectedIndex = 0;
  String phone;
  _DoctorTaskPageState(this.phone);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    DocHomePage(),
    Text(
      'Likes',
      style: optionStyle,
    ),
    DocOrder(),
   DocProfile(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.comment,
                  text: 'Comment',
                ),
                GButton(
                  icon: LineIcons.box,
                  text: 'Orders',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

}
