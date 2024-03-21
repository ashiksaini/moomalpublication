import 'package:flutter/widgets.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/test_series/data/models/term_model.dart';

class SubTabItem extends StatelessWidget {
  final String title;
  final Term term;
  final Function onClick;
  final bool isSelected;

  const SubTabItem({
    super.key,
    required this.title,
    required this.term,
    required this.onClick,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(term),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.orangeLight1 : AppColors.white,
            borderRadius: BorderRadius.circular(5.r),
            border:
                Border.all(color: isSelected ? AppColors.white : AppColors.grey),
            boxShadow: isSelected ? [primaryBoxShadow()] : null),
        child: Center(
          child: CustomText(
            text: title,
            maxLines: 1,
            textStyle: CustomTextStyle.textStyle20Bold(
              context,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
