import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const transparent = Color(0x00000000);

  static const primary = Color(0xFF4875FF);
  static const primaryDark = Color(0xFF1A2734);
  static const scaffoldBackground = Color(0xFFFCFDFF);

  static const textPrimary = Color(0xFF1A2734);
  static const textPrimaryMedium = Color(0xFF777E85);
  static const textPrimaryLight = Color(0xFF929CA6);

  static const grey = Color(0xFF929CA6);
  static const greyMedium = Color(0xFFF6F8FB);
  static const greyLight = Color(0xFFECF0F4);
  static const red = Color(0xFFEE3D3D);
  static const orange = Color(0xFFFF9800);
  static const green = Color(0xFF1BA27A);
  static const greenLight = Color(0xFF59D603);
  static const purple = Color(0xFF9253C8);
  static const deselected = Color(0xFF78838E);

  static const shadowColor = Color(0xFFC4C4C4);


  static const splashGradient = LinearGradient(
    colors: [Color(0xFF21D0FD), Color(0xFF9546FF)],
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
  );

  static const yellowGradient = LinearGradient(
    colors: [Color(0xFFFF8008), Color(0xFFFFC837)],
    begin: AlignmentDirectional.centerEnd,
    end: AlignmentDirectional.centerStart,
  );

  static const greenGradient = LinearGradient(
    colors: [Color(0xFF1D976C), Color(0xFF93F9B9)],
    begin: AlignmentDirectional.centerEnd,
    end: AlignmentDirectional.centerStart,
  );

  static const blueGradient = LinearGradient(
    colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)],
    begin: AlignmentDirectional.centerEnd,
    end: AlignmentDirectional.centerStart,
  );
}
