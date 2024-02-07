import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/bottom_sheets/common_bottom_model_sheet.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';
import 'package:moomalpublication/features/address/data/models/address_model.dart';
import 'package:moomalpublication/features/address/presentation/widgets/add.dart';
import 'package:moomalpublication/features/address/presentation/widgets/fill_address_card.dart';

class AddressBottomSheet {
  Future<dynamic> bottomSheet({
    required BuildContext context,
    required String headerText,
    required RxList<AddressTextEditingController> addressList,
    required Function onSubmitButton,
  }) {
    Widget addressBottomSheet = SizedBox(
      height: screenHeight(context) / 1.3,
      child: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textAlign: TextAlign.start,
                  text: headerText,
                  textStyle: CustomTextStyle.textStyle25Bold(context,
                      color: AppColors.black),
                ),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: addressList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FillAddressCard(
                        keyboardType: addressList[index].keyboardType,
                        optional: addressList[index].optional,
                        headingText: addressList[index].name,
                        hintText: addressList[index].hint,
                        textEditingController: addressList[index].controller,
                        error: addressList[index].error!.value,
                      ).paddingOnly(bottom: scaleHeight(10, context));
                    },
                  ).paddingOnly(top: scaleHeight(12, context)),
                ),
                Center(
                        child: CustomOrangeButton(
                            onTapButton: () {
                              onSubmitButton();
                            },
                            buttonText: "save_address".tr))
                    .paddingSymmetric(vertical: scaleHeight(10, context)),
              ],
            ).paddingAll(
              scaleWidth(10, context),
            ),
          ),
        ),
      ),
    ).paddingOnly(top: scaleHeight(10, context));
    return CommonBottomSheet()
        .commonbottomSheet(context, addressBottomSheet, isDismissible: true);
  }
}
