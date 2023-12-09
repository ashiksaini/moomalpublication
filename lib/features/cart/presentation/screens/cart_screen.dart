import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/templates/card_card.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/order_details.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppbar(
            title: "My Cart",
            maxLine: 1,
            prefixIcon: AppAssets.icBackArrow,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: scaleWidth(6, context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ShadowContainer(
                      containerChild: CartCard(),
                    ),
                    const VerticalGap(size: 32),
                    ShadowContainer(
                      containerChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: scaleWidth(20, context),
                                top: scaleWidth(14, context)),
                            child: CustomText(
                              text: "Popular Books",
                              textStyle: CustomTextStyle.textStyle20Bold(
                                context,
                              ),
                            ),
                          ),
                          const CartCard(
                            addButton: true,
                          ),
                          const CartCard(
                            addButton: true,
                          ),
                        ],
                      ),
                    ),
                    const VerticalGap(size: 32),
                    const ShadowContainer(containerChild: OrderDetails())
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
