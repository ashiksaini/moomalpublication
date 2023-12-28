import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/address/presentation/widgets/add.dart';
import 'package:moomalpublication/routes/routing.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: "Addresses",
              maxLine: 1,
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: scaleHeight(46, context),
                      horizontal: scaleWidth(10, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          textAlign: TextAlign.start,
                          text:
                              "The following addresses will be used on the checkout page by default. ",
                          textStyle: CustomTextStyle.textStyle25Bold(context,
                              color: AppColors.black)),
                      const VerticalGap(size: 20),
                      CustomText(
                          textAlign: TextAlign.start,
                          text: "BILLING ADDRESS:",
                          textStyle: CustomTextStyle.textStyle30Bold(
                            context,
                            color: AppColors.black,
                            decoration: TextDecoration.underline,
                          )),
                      const VerticalGap(size: 10),
                      CustomText(
                          textAlign: TextAlign.start,
                          text: "You have not set up this type of address yet.",
                          textStyle: CustomTextStyle.textStyle25Bold(context,
                              color: AppColors.black)),
                      const VerticalGap(size: 10),
                      const AddButton(),
                      const VerticalGap(size: 20),
                      CustomText(
                          textAlign: TextAlign.start,
                          text: "SHIPPING ADDRESS:",
                          textStyle: CustomTextStyle.textStyle30Bold(
                            context,
                            color: AppColors.black,
                            decoration: TextDecoration.underline,
                          )),
                      const VerticalGap(size: 10),
                      CustomText(
                          textAlign: TextAlign.start,
                          text: "You have not set up this type of address yet.",
                          textStyle: CustomTextStyle.textStyle25Bold(context,
                              color: AppColors.black)),
                      const VerticalGap(size: 10),
                      const AddButton()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
