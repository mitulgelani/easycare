import 'package:easycare/res/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme => ThemeData(
        primaryColor: AppColor.primary,
        primaryColorDark: AppColor.primaryDark,
        cardTheme: cardTheme,
        dividerTheme: dividerTheme,
        fontFamily: 'Oswald',
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: AppColor.primary,
          background: AppColor.white,
          onPrimary: AppColor.white,
          onError: AppColor.red,
          secondary: AppColor.primary,
          onSecondary: AppColor.white,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColor.primary,
          selectionColor: AppColor.primary.withOpacity(0.3),
          selectionHandleColor: AppColor.primary,
        ),
        elevatedButtonTheme: elevatedButtonTheme,
        scaffoldBackgroundColor: AppColor.scaffoldBackground,
        shadowColor: AppColor.shadowColor.withOpacity(0.5),
        dialogTheme: dialogTheme,
        bottomSheetTheme: bottomSheetTheme,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            color: AppColor.textPrimaryLight,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: 'Oswald',
          ),
          errorStyle: const TextStyle(
            color: AppColor.red,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: 'Oswald',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.greyLight),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.greyLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.greyLight),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.primary),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.red),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          fillColor: AppColor.white,
          filled: true,
        ),
        radioTheme: radioTheme,
        checkboxTheme: checkBoxTheme,
        bottomAppBarTheme:
            const BottomAppBarTheme(elevation: 0, color: AppColor.transparent),
        popupMenuTheme: PopupMenuThemeData(
          color: AppColor.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          textStyle: const TextStyle(
            color: AppColor.textPrimary,
            fontSize: 14,
            fontFamily: 'Oswald',
            fontWeight: FontWeight.w600,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.white,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColor.white,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          actionTextColor: AppColor.primary,
          elevation: 4,
          contentTextStyle: const TextStyle(
            color: AppColor.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Oswald',
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.transparent,
          elevation: 0,
          centerTitle: false,
          shadowColor: AppColor.greyLight,
          foregroundColor: AppColor.primaryDark,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: AppColor.primary,
          unselectedLabelColor: AppColor.textPrimaryLight,
          labelStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Oswald'),
          unselectedLabelStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Oswald'),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColor.greyLight,
          disabledColor: AppColor.grey.withAlpha(150),
          selectedColor: AppColor.primary,
          secondarySelectedColor: AppColor.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          labelStyle: const TextStyle(
            fontFamily: 'Oswald',
            fontSize: 12,
            color: AppColor.textPrimaryLight,
            fontWeight: FontWeight.w500,
          ),
          secondaryLabelStyle: const TextStyle(
            fontFamily: 'Oswald',
            fontSize: 12,
            color: AppColor.white,
            fontWeight: FontWeight.w500,
          ),
          brightness: Brightness.light,
        ),
      );

  static BottomSheetThemeData get bottomSheetTheme =>
      const BottomSheetThemeData(
        backgroundColor: AppColor.white,
        clipBehavior: Clip.hardEdge,
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        modalElevation: 8,
        modalBackgroundColor: AppColor.white,
      );

  static RadioThemeData get radioTheme => RadioThemeData(
        fillColor: MaterialStateProperty.all(AppColor.black),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  static CheckboxThemeData get checkBoxTheme => CheckboxThemeData(
        fillColor: MaterialStateProperty.all(AppColor.primary),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      );

  static CardTheme get cardTheme => CardTheme(
        elevation: 16,
        shadowColor: AppColor.greyLight.withOpacity(0.5),
        clipBehavior: Clip.hardEdge,
        color: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.zero,
      );

  static DialogTheme get dialogTheme => DialogTheme(
        elevation: 16,
        backgroundColor: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      );

  static DividerThemeData get dividerTheme =>
      const DividerThemeData(color: AppColor.greyLight, space: 1, thickness: 1);

  static ElevatedButtonThemeData get elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) return 4;
            return 0;
          }),
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColor.primary.withAlpha(150);
            }
            return AppColor.primary;
          }),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColor.white.withOpacity(0.2);
            } else if (states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.focused)) {
              return AppColor.white.withOpacity(0.1);
            } else {
              return AppColor.transparent;
            }
          }),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
        ),
      );
}
