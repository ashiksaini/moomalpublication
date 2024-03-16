import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/thank_you_page/data/models/order_succes_response/order_succes_response.dart';
import 'package:moomalpublication/features/thank_you_page/presentation/widgets/order_detail_list.dart';

class OrderDetailTemplate extends StatelessWidget {
  const OrderDetailTemplate({super.key, required this.orderSuccessResponse});
  final OrderSuccessResponse orderSuccessResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 10.h, right: 14.h, top: 14.v, bottom: 6.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceTextBold(
                  leftText: 'Order Details', rightText: '', context: context),
              Divider(
                height: 1.h,
                color: AppColors.grey,
              ),
              const VerticalGap(size: 6),
              spaceTextBold(
                  leftText: 'Products', rightText: 'Total', context: context),
              const VerticalGap(size: 2),
              OrderDetailList(
                orderDetail: orderSuccessResponse.orderDetails ?? [],
              ),
              const VerticalGap(size: 8),
              Divider(
                height: 1.h,
                color: AppColors.grey,
              ),
              spaceTextBold(
                  leftText: 'Subtotal', rightText: '₹25', context: context),
              Divider(
                height: 1.h,
                color: AppColors.grey,
              ),
              spaceTextBold(
                  leftText: 'Payment Method',
                  rightText: 'COD',
                  context: context),
              Divider(
                height: 1.h,
                color: AppColors.grey,
              ),
              spaceTextBold(
                  leftText: 'Total', rightText: '₹25', context: context),
            ],
          ),
        ),
      ],
    );
  }

  Widget spaceTextBold(
      {required String leftText,
      required String rightText,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3.h,
        top: 5.v,
        bottom: 3.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
              text: leftText,
              textStyle: CustomTextStyle.textStyle20Bold(context,
                  color: AppColors.black)),
          CustomText(
              text: rightText,
              textStyle: CustomTextStyle.textStyle20Bold(context,
                  color: AppColors.black))
        ],
      ),
    );
  }
}
