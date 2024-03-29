import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class BottomMarker extends StatelessWidget {
  const BottomMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: CustomText(
          text: "©_2021_Moomal_Publication_All_rights_reserved".tr,
          textStyle: CustomTextStyle.textStyle20SemiMedium(context,
              color: Colors.grey),
        ),
      ),
    );
  }
}
