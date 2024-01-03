import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/date_time_utils.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/product_detail/data/models/product_review.dart';
import 'package:moomalpublication/features/product_detail/presentation/widgets/rating_bar.dart';

class ReviewView extends StatelessWidget {
  final ProductReview productReview;

  const ReviewView({
    super.key,
    required this.productReview,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: scaleWidth(10, context), top: scaleHeight(10, context), bottom: scaleHeight(10, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User and DatenTime
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.icUser1),
                  const HorizontalGap(size: 10),
                  CustomText(
                    text: productReview.author,
                    textStyle: CustomTextStyle.textStyle15Bold(context, color: AppColors.black),
                  ),
                ],
              ),
              CustomText(
                text: DateTimeUtils.formatDateTime(productReview.date ?? "", AppConstants.dateTimeFormatter),
                textStyle: CustomTextStyle.textStyle15Bold(context),
              ),
            ],
          ),
          const VerticalGap(size: 5),

          // Rating
          StarRatingBar(
            initialRating: double.parse(productReview.rating ?? "0.0"),
            itemSize: 15,
            ignoreGesture: true,
          ),
          const VerticalGap(size: 8),

          // Content
          CustomText(
            text: productReview.content,
            textStyle: CustomTextStyle.textStyle15Bold(context),
          ),
        ],
      ),
    );
  }
}
