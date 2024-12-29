import 'package:flutter/material.dart';
import '../colors.dart';
import '../sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class QElevatedButtonTheme {
  QElevatedButtonTheme._(); // To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      // Slight elevation for better depth
      foregroundColor: QColors.white,
      // Switched to secondary for better contrast
      backgroundColor: QColors.primary,
      disabledForegroundColor: Colors.black38,
      disabledBackgroundColor: Colors.grey[300],
      // Slightly lighter for a softer disabled state
      // side: BorderSide(color: QColors.primary, width: 1.5),
      // Consistent with primary color
      padding: EdgeInsets.symmetric(vertical: QSizes.buttonHeight),
      textStyle: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(QSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      // Similar elevation in dark mode for consistency
      foregroundColor: QColors.white,
      backgroundColor: QColors.primary,
      // Switch to primary to keep it consistent with the light theme
      disabledForegroundColor: Colors.white38,
      // Softer white for disabled
      disabledBackgroundColor: Colors.grey[700],
      // Darker grey for better contrast in dark mode
      // side: const BorderSide(color: QColors.white, width: 1.5),
      // Matching secondary color for dark theme
      padding: const EdgeInsets.symmetric(vertical: QSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(QSizes.buttonRadius)),
    ),
  );
}
