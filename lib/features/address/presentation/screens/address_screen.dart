import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/address/controller/address_controller.dart';
import 'package:moomalpublication/features/address/presentation/template/address_bottom_sheet.dart';
import 'package:moomalpublication/features/address/presentation/widgets/address_card.dart';
import 'package:moomalpublication/routes/routing.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});
  final AdressController controller =
      Get.put<AdressController>(AdressController());

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
                      vertical: scaleHeight(36, context),
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
                      AddressCard(
                        address:
                            "you_have_not_set_up_this_type_of_address_yet".tr,
                        addressHeading: "billing_address".tr,
                        onTap: () {
                          AddressBottomSheet().bottomSheet(
                              context: context,
                              headerText: "billing_address".tr,
                              addressList: controller.billingAddressList,
                              onSubmitButton: controller.onSubmitBillingButton);
                        },
                      ),
                      AddressCard(
                        address:
                            "you_have_not_set_up_this_type_of_address_yet".tr,
                        addressHeading: "shipping_address".tr,
                        onTap: () {
                          AddressBottomSheet().bottomSheet(
                              context: context,
                              headerText: "shipping_address".tr,
                              addressList: controller.shippingAddressList,
                              onSubmitButton:
                                  controller.onSubmitShippingButton);
                        },
                      ),
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
