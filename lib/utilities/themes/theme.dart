import 'package:flutter/material.dart';
import 'package:pd_scan/utilities/themes/text_field_theme.dart';
import 'package:pd_scan/utilities/themes/text_theme.dart';


import 'appbar_theme.dart';
import 'elevated_button.dart';

class QAppTheme {
  QAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    disabledColor: Colors.grey,
    brightness: Brightness.light,
    primaryColor:const Color(0xffFF8C00),
    textTheme: QTextTheme.lightTextTheme,
    // chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: QAppBarTheme.lightAppBarTheme,
    // checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    // bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: QElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: QTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    disabledColor: Colors.grey,
    brightness: Brightness.dark,
    primaryColor:const Color(0xffFF8C00),
    textTheme: QTextTheme.darkTextTheme,
    // chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: QAppBarTheme.darkAppBarTheme,
    // checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    // bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: QElevatedButtonTheme.darkElevatedButtonTheme,
    // outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: QTextFormFieldTheme.darkInputDecorationTheme,

  );
}
