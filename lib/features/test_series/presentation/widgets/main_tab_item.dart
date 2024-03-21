import 'package:flutter/widgets.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/test_series/data/constants/enums.dart';

class MainTabItem extends StatelessWidget {
  final String title;
  final TestSeriesMainTabType testSeriesMainTabType;
  final Function onClick;
  final bool isSelected;

  const MainTabItem({
    super.key,
    required this.title,
    required this.testSeriesMainTabType,
    required this.onClick,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(testSeriesMainTabType),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 12.v),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.orange : AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            border:
                Border.all(color: isSelected ? AppColors.white : AppColors.grey),
            boxShadow: isSelected ? [primaryBoxShadow()] : null),
        child: Center(
          child: CustomText(
            text: title,
            textStyle: CustomTextStyle.textStyle20Bold(
              context,
              color: isSelected ? AppColors.white : AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
