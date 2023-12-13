import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/theme/colors.dart';

class Screen extends StatelessWidget {
  final Color? statusBarColor;
  final Color? screenBg;
  final Brightness? statusBarIconBrightness;
  final Brightness? statusBarBrightness;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Drawer? drawer;
  final Key? scaffoldKey;
  final Function? onRefresh;
  final bool isAppbarVisible;
  final String? appBarTitle;
  final String? prefixIcon;
  final String? suffixIcon;
  final Function? onPrefixIconClick;
  final Function? onSuffixIconClick;
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
    this.onRefresh,
    this.drawer,
    this.isAppbarVisible = true,
    this.appBarTitle,
    this.prefixIcon,
    this.suffixIcon,
    this.onPrefixIconClick,
    this.onSuffixIconClick,
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
          child: RefreshIndicator(
            backgroundColor: AppColors.white,
            color: AppColors.orange,
            onRefresh: () => onRefresh!(),
            child: Column(
              children: [
                // App bar
                if (isAppbarVisible)
                  CustomAppbar(
                    title: appBarTitle ?? "",
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    onPrefixIconClick: onPrefixIconClick,
                    onSuffixIconClick: onSuffixIconClick,
                    maxLine: 1,
                  ),

                // Screen
                Expanded(
                  child: Container(
                    margin: margin,
                    padding: padding,
                    color: screenBg ?? AppColors.white,
                    child: SingleChildScrollView(child: child),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
