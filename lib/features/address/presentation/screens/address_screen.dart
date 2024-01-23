import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              title: "addresses".tr,
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
                              "the_following_addresses_will_be_used_on_the_checkout_page_by_default"
                                  .tr,
                          textStyle: CustomTextStyle.textStyle25Bold(context,
                              color: AppColors.black)),
                      const VerticalGap(size: 20),
                      CustomText(
                          textAlign: TextAlign.start,
                          text: "billing_address".tr,
                          textStyle: CustomTextStyle.textStyle30Bold(
                            context,
                            color: AppColors.black,
                            decoration: TextDecoration.underline,
                          )),
                      const VerticalGap(size: 10),
                      CustomText(
                          textAlign: TextAlign.start,
                          text:
                              "you_have_not_set_up_this_type_of_address_yet".tr,
                          textStyle: CustomTextStyle.textStyle25Bold(context,
                              color: AppColors.black)),
                      const VerticalGap(size: 10),
                      const AddButton(),
                      const VerticalGap(size: 20),
                      CustomText(
                          textAlign: TextAlign.start,
                          text: "shipping_address".tr,
                          textStyle: CustomTextStyle.textStyle30Bold(
                            context,
                            color: AppColors.black,
                            decoration: TextDecoration.underline,
                          )),
                      const VerticalGap(size: 10),
                      CustomText(
                          textAlign: TextAlign.start,
                          text:
                              "you_have_not_set_up_this_type_of_address_yet".tr,
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
