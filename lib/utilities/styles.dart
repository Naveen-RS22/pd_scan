import 'package:flutter/material.dart';
import 'package:pd_scan/utilities/sizes.dart';


class SpacingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: QSizes.appBarHeight,
    left: QSizes.defaultSpace,
    bottom: QSizes.defaultSpace,
    right: QSizes.defaultSpace,
  );
  static const EdgeInsetsGeometry paddingWithDefault = EdgeInsets.only(
    top: QSizes.defaultSpace,
    left: QSizes.defaultSpace,
    bottom: QSizes.defaultSpace,
    right: QSizes.defaultSpace,
  );
  static const EdgeInsetsGeometry paddingWithDefaultNoTop = EdgeInsets.only(
    top: 0,
    left: QSizes.defaultSpace,
    bottom: QSizes.defaultSpace,
    right: QSizes.defaultSpace,
  );
}
