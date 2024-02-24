import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class WriteReviewView extends StatelessWidget {
  final String title;
  final Function onClick;
  const WriteReviewView(
      {super.key, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        padding: EdgeInsets.only(
          top: 10.v,
          bottom: 10.v,
          left: 14.h,
          right: 8.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [primaryBoxShadow()],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: title,
                textStyle: CustomTextStyle.textStyle20Bold(context)),
            SvgPicture.asset(AppAssets.icForwardArrow),
          ],
        ),
      ),
    );
  }
}
