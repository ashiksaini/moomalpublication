import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/card_book_item.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: Container(
            height: screenHeight(context),
            color: AppColors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbar(title: "title", prefixIcon: AppAssets.icBackArrow, suffixIcon: AppAssets.icSearch,),
                  CustomText(text: "explore".tr, textStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.black)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: scaleWidth(10, context)),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 0.48,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return CardBookItem();
                      },
                    ),
                  ),
                  const VerticalGap(size: 32),
                  CustomText(text: "new_arrival".tr, textStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.black)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: scaleWidth(10, context)),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 0.48,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return CardBookItem();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
