import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/routes/routing.dart';

class SettingDetailedScreen extends StatelessWidget {
  SettingDetailedScreen({super.key});

  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String appBarTitle = args[0]['appBarTitle'];
    String description = args[1]['description'];
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: appBarTitle,
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
              maxLine: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(12, context),
                    vertical: scaleHeight(18, context),
                  ),
                  child: Html(data: description),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
