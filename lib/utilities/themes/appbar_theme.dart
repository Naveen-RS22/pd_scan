import 'package:flutter/material.dart';

import '../colors.dart';
import '../sizes.dart';


class QAppBarTheme{
  QAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: QColors.black, size: QSizes.iconMd),
    actionsIconTheme: IconThemeData(color: QColors.black, size: QSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: QColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: QColors.black, size: QSizes.iconMd),
    actionsIconTheme: IconThemeData(color: QColors.white, size: QSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: QColors.white),

  );
}