import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/event_press_release/controller/event_press_controller.dart';

class YearContainer extends StatelessWidget {
  YearContainer({
    super.key,
    required this.yearIndex,
  });
  final int yearIndex;
  final EventPressController _eventPressController =
      Get.find<EventPressController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _eventPressController.onYearClick(currentYear: yearIndex);
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(10.r)),
              color: _eventPressController.yearListData[yearIndex].clicked!
                  ? AppColors.orange
                  : AppColors.orangeLight),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.h,
              vertical: 6.h,
            ),
            child: CustomText(
                text: _eventPressController.yearListData[yearIndex].year
                    .toString(),
                textStyle: CustomTextStyle.textStyle20Bold(context,
                    color: AppColors.black)),
          ),
        ).paddingSymmetric(horizontal: 5.h),
      ),
    );
  }
}
