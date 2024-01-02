import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/contact_us/presentation/widgets/bottom_marker.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/test_grid_sheet.dart';

class TestDataCard extends StatelessWidget {
  const TestDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(14, context),
          vertical: scaleHeight(30, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Online Exam',
            textStyle: CustomTextStyle.textStyle25Bold(context,
                color: AppColors.black, decoration: TextDecoration.underline),
          ),
          TestGridSheet(),
          const BottomMarker(),
        ],
      ),
    );
  }
}
