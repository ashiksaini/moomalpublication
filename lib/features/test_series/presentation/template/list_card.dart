import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/test_series/data/constants/enums.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/button_bar.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/marks_row.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.entry});

  final TestSeriesResponseModel entry;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      borderRadius: 10.r,
      borderColor: AppColors.greyLight,
      containerChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: Column(
          children: [
            CustomButtonBar(
              buttonText: entry.testAvailbilityType == TestAvailbilityType.paid ? 'buy_now'.tr : 'start_test'.tr,
              barText: entry.postTitle ?? '',
              permalink: entry.permalink,
              entry: entry,
            ),
            MarksRow(
              entry: entry,
              showPrice: entry.testAvailbilityType == TestAvailbilityType.paid ? true : false,
            ),
          ],
        ),
      ),
    );
  }
}
