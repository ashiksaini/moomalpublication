import 'package:flutter/material.dart';

// change Here as per figma
const double baseHeight = 800;
const double baseWidth = 360;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double scaleHeight(double val, BuildContext context) =>
    MediaQuery.of(context).size.height / baseHeight * val;
double scaleWidth(double val, BuildContext context) =>
    MediaQuery.of(context).size.width / baseWidth * val;
double scaleRadius(double val, BuildContext context) =>
    MediaQuery.of(context).size.height / baseHeight * val;
