import 'package:flutter/material.dart';

import '../colors.dart';
import '../sizes.dart';

class QTextFormFieldTheme {
  QTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: QColors.darkGrey,
    suffixIconColor: QColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: QSizes.fontSizeMd, color: QColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: QSizes.fontSizeSm, color: QColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: QColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: QColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: QColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: QColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: QColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: QColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: QColors.darkGrey,
    suffixIconColor: QColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: QSizes.fontSizeMd, color: QColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: QSizes.fontSizeSm, color: QColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: QColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: QColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: QColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: QColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: QColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: QColors.warning),
    ),
  );
}
