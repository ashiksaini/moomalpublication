import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';

class Screen extends StatelessWidget {
  final Color? statusBarColor;
  final Color? screenBg;
  final Brightness? statusBarIconBrightness;
  final Brightness? statusBarBrightness;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Drawer? drawer;
  final Key? scaffoldKey;
  final Widget child;

  const Screen({
    super.key,
    required this.child,
    this.screenBg,
    this.statusBarColor,
    this.padding,
    this.margin,
    this.scaffoldKey,
    this.statusBarBrightness,
    this.statusBarIconBrightness,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? AppColors.black,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.light,
        statusBarBrightness: statusBarBrightness ?? Brightness.dark,
      ),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: screenBg ?? AppColors.white,
        drawer: drawer,
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: Container(
              margin: margin,
              padding: padding,
              height: screenHeight(context),
              color: screenBg ?? AppColors.white,
              child: SingleChildScrollView(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
