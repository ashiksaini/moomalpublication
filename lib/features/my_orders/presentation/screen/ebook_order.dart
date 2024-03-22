import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/my_orders/presentation/template/order_detail_card.dart';
import 'package:moomalpublication/features/my_orders/presentation/template/product_detail.dart';
import 'package:moomalpublication/features/my_orders/presentation/template/shipping_detail_card.dart';

class EbookOrderScreen extends StatelessWidget {
  const EbookOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbar(title: 'Ebook Order'),
            const VerticalGap(size: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: CustomText(
                  textAlign: TextAlign.start,
                  text:
                      'Order ID #458 was placed on March 4, 2024 and is currently Completed.Payment Mode Online',
                  textStyle: CustomTextStyle.textStyle13Medium(context,
                      color: AppColors.black)),
            ),
            const Divider(height: 1),
            const VerticalGap(size: 14),
            const ProductDetailCard(),
            const VerticalGap(size: 12),
            const OrderDetailCard(),
            const ShippingDetailCard(),
          ],
        ),
      ),
    );
  }
}
