import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';

class CustomChipButton extends StatelessWidget {
  final String icon;
  final String title;
  final Function onClick;

  const CustomChipButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.v),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: AppColors.black,
              width: 24.h,
              height: 24.h,
            ),
            const HorizontalGap(size: 10),
            CustomText(
              text: title,
              textStyle: CustomTextStyle.textStyle22Bold(
                context,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
