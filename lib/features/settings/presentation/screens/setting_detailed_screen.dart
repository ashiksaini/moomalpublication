import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class SettingDetailedScreen extends StatelessWidget {
  SettingDetailedScreen({super.key});

  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String appBarTitle = args[0]['appBarTitle'];
    String description = args[1]['description'];
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppbar(
            title: appBarTitle,
            prefixIcon: AppAssets.icBackArrow,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: scaleWidth(12, context),
                vertical: scaleHeight(18, context)),
            child: CustomText(
              text: description,
              textStyle: CustomTextStyle.textStyle18Medium(
                context,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
