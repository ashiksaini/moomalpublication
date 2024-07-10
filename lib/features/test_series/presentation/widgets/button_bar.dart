import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/features/test_series/controller/test_series_controller.dart';
import 'package:moomalpublication/features/test_series/data/constants/enums.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class CustomButtonBar extends StatelessWidget {
  CustomButtonBar(
      {super.key,
      required this.buttonText,
      required this.barText,
      this.buttonVisibility = true,
      this.textDecoration = TextDecoration.none,
      this.permalink,
      this.entry});
  final String buttonText;
  final bool buttonVisibility;
  final String barText;
  final String? permalink;
  final TextDecoration textDecoration;
  final TestSeriesResponseModel? entry;
  final TestSeriesController _testSeriesController =
      Get.put(TestSeriesController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.h),
              child: CustomText(
                text: barText,
                maxLines: 3,
                textAlign: TextAlign.start,
                textStyle: CustomTextStyle.textStyle22Bold(
                  context,
                  color: AppColors.black,
                  decoration: textDecoration,
                ),
              ),
            ),
          ),
          if (buttonVisibility)
            GestureDetector(
              onTap: () {
                if (buttonText.toLowerCase().compareTo("reattempt") == 0) {
                } else {
                  if (entry?.testAvailbilityType == TestAvailbilityType.free) {
                    AppRouting.toNamed(NameRoutes.newtestSeriesScreen,
                        argument: SharedData(testModel: entry));
                  } else {
                    _testSeriesController.buyTest(entry);
                  }
                }
              },
              child: Container(
                height: 40.v,
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                decoration: BoxDecoration(
                  color: AppColors.skinDark,
                  border: Border.all(color: AppColors.skinDark),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: CustomText(
                    text: buttonText,
                    textStyle: CustomTextStyle.textStyle16Bold(
                      context,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
