import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class FiltersBottomSheet extends StatelessWidget {
  final Function onClick;

  const FiltersBottomSheet({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      padding: EdgeInsets.symmetric(
        vertical: scaleHeight(14, context),
        horizontal: scaleWidth(14, context),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(scaleRadius(10, context)),
          topRight: Radius.circular(scaleRadius(10, context)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getSortByView(
            context,
            "sort_by_popularity".tr,
            () => onClick(SortBy.popularity),
          ),
          const VerticalGap(size: 10),
          _getSortByView(
            context,
            "sort_by_average_rating".tr,
            () => onClick(SortBy.popularity),
          ),
          const VerticalGap(size: 10),
          _getSortByView(
            context,
            "sort_by_price_l_to_h".tr,
            () => onClick(SortBy.popularity),
          ),
          const VerticalGap(size: 10),
          _getSortByView(
            context,
            "sort_by_price_h_to_l".tr,
            () => onClick(SortBy.popularity),
          ),
        ],
      ),
    );
  }

  Widget _getSortByView(BuildContext context, String title, Function onClick) {
    return GestureDetector(
      onTap: () => onClick(),
      child: CustomText(
        text: title,
        textStyle: CustomTextStyle.textStyle20SemiBold(context),
        textAlign: TextAlign.start,
      ),
    );
  }
}
