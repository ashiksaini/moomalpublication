import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

void showToast(
  String title, {
  Color? bgColor,
  Color? textColor,
}) {
  Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor ?? AppColors.green,
      textColor: textColor ?? AppColors.white,
      fontSize: 16.0.h);
}
