import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/date_time_utils.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/thank_you_page/data/models/order_succes_response/order_succes_response.dart';

class BillTemplate extends StatelessWidget {
  const BillTemplate({super.key, required this.orderSuccessResponse});
  final OrderSuccessResponse orderSuccessResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(SizeUtils.width),
            bottomRight: Radius.circular(SizeUtils.width),
          ),
          child: Container(
            width: SizeUtils.width,
            height: SizeUtils.width / 2,
            color: AppColors.green_100,
            child: Column(children: [
              const VerticalGap(size: 20),
              SvgPicture.asset(
                AppAssets.icCheck,
                width: 57.r,
              ),
              const VerticalGap(size: 22),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 140.h),
                child: CustomText(
                  text: 'Thank you for your order',
                  textStyle: CustomTextStyle.textStyle24Bold(context,
                      color: AppColors.white),
                ),
              ),
            ]),
          ),
        ),
        const VerticalGap(size: 22),
        Padding(
          padding: EdgeInsets.only(left: 14.h, right: 20.h),
          child: Column(
            children: [
              spaceTextRegular(
                  leftText: 'Order Number',
                  rightText: orderSuccessResponse.orderNumber ?? '',
                  context: context),
              const VerticalGap(size: 2),
              Divider(
                height: 1.h,
                color: AppColors.grey,
              ),
              const VerticalGap(size: 10),
              spaceTextRegular(
                  leftText: 'Date',
                  rightText: DateTimeUtils.formatDate(
                    date: orderSuccessResponse.date ?? DateTime.now(),
                    formatType: AppConstants.dateFormatter,
                  ),
                  context: context),
              spaceTextRegular(
                  leftText: 'Email',
                  rightText: orderSuccessResponse.email ?? '',
                  context: context),
              spaceTextRegular(
                  leftText: 'Payment Method',
                  rightText: orderSuccessResponse.paymentMethod ?? '',
                  context: context),
              const VerticalGap(size: 4),
              Divider(
                height: 1.h,
                color: AppColors.grey,
              ),
              spaceTextRegular(
                  leftText: 'Total Amount',
                  rightText: '₹ ${orderSuccessResponse.total ?? ''}',
                  context: context),
            ],
          ),
        ),
      ],
    );
  }

  Widget spaceTextRegular(
      {required String leftText,
      required String rightText,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
              text: leftText,
              textStyle: CustomTextStyle.textStyle18Regular(context,
                  color: AppColors.black)),
          CustomText(
              text: rightText,
              textStyle: CustomTextStyle.textStyle18Regular(context,
                  color: AppColors.black))
        ],
      ),
    );
  }
}
