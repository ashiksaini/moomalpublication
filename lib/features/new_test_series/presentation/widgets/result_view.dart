import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/new_test_series/data/constants/enums.dart';

class ResultView extends StatelessWidget {
  final ResultType resultType;
  final String value;

  const ResultView({super.key, required this.resultType, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
      decoration: BoxDecoration(
          color: AppColors.orange_100,
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(children: [
        SvgPicture.asset(
          resultType == ResultType.rank ? AppAssets.icRank : AppAssets.icMarks,
        ),
        const HorizontalGap(size: 10),
        Column(
          children: [
            CustomText(
              text: resultType == ResultType.rank
                  ? 'your_rank'.tr
                  : 'your_marks'.tr,
              textStyle: CustomTextStyle.textStyle16MediumTrio(
                context,
                color: AppColors.grey,
              ),
            ),
            CustomText(
              text: value,
              textStyle: CustomTextStyle.textStyle18BoldCaladea(
                context,
                color: AppColors.black,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
