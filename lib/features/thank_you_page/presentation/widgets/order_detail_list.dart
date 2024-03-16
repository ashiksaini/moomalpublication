import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/features/thank_you_page/data/models/order_succes_response/order_detail.dart';

class OrderDetailList extends StatelessWidget {
  const OrderDetailList({Key? key, required this.orderDetail})
      : super(key: key);
  final List<OrderDetail> orderDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: orderDetail.map((e) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: CustomText(
                    textAlign: TextAlign.start,
                    text: '${e.productName} ',
                    textStyle: CustomTextStyle.textStyle19Bold(context,
                        color: AppColors.blueDark),
                  ),
                ),
                CustomText(
                  text: '₹${e.subtotal}',
                  textStyle: CustomTextStyle.textStyle20Bold(context,
                      color: AppColors.black),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textAlign: TextAlign.start,
                    text: 'Purchase: ${e.variantName}',
                    textStyle: CustomTextStyle.textStyle18Regular(context,
                        color: AppColors.black),
                  ),
                  CustomText(
                    text: 'Product ID: ${e.variantId}',
                    textStyle: CustomTextStyle.textStyle18Regular(context,
                        color: AppColors.black),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
