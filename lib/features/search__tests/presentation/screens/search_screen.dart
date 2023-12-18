import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/text_fields.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: scaleHeight(100, context),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(scaleRadius(20, context)),
                    bottomRight: Radius.circular(scaleRadius(20, context)),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: scaleWidth(10, context)),
                  child: customTextFormField(
                    context,
                    TextEditingController(),
                    prefixIcon: AppAssets.icBackSmall,
                    suffixIcon: AppAssets.icClose,
                    hint: "Search for Books and  Ebooks",
                    hintTextStyle: CustomTextStyle.textStyle15Bold(context),
                  ),
                ),
              )
            ],
          ),
          Expanded(child: _getCenterSearchView(context)),
        ],
      ),
    );
  }

  Widget _getCenterSearchView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: scaleHeight(150, context)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.icSearchScreenBg,
            height: scaleHeight(190, context),
            width: scaleWidth(200, context),
          ),
          const VerticalGap(size: 67),
          CustomText(
            text: "Search in Moomal Publication",
            textStyle: CustomTextStyle.textStyle20Bold(context, color: AppColors.black),
          ),
          const VerticalGap(size: 10),
          CustomText(
            text: "Find Books, Ebooks for current GK and \nMany more books",
            textStyle: CustomTextStyle.textStyle15Bold(context),
          ),
        ],
      ),
    );
  }
}
