import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/date_time_utils.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/address/presentation/widgets/add.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/my_orders/presentation/widgets/image_container.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model.dart';

class MyOrderCard extends StatelessWidget {
  const MyOrderCard(
      {super.key,
      required this.lineItem,
      this.datePaid,
      required this.onTapCard});
  final LineItem lineItem;
  final DateTime? datePaid;
  final Function onTapCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: ShadowContainer(
        borderRadius: 10,
        backgroundColor: AppColors.orange_100,
        borderColor: AppColors.grey,
        containerChild: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: '${'order_id'.tr} #${lineItem.id}',
                      textStyle: CustomTextStyle.textStyle12Medium(context,
                          color: AppColors.black)),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 8.v),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageContainer(
                    image: lineItem.image != null ? lineItem.image!.src : '',
                  ),
                  const HorizontalGap(size: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            textAlign: TextAlign.start,
                            text: lineItem.name,
                            textStyle: CustomTextStyle.textStyle20Bold(context,
                                color: AppColors.black)),
                        CustomText(
                            text: DateTimeUtils.formatDateTime(
                              inputDateString: datePaid.toString(),
                              outputFormat: AppConstants.dateFormatter,
                            ),
                            textStyle: CustomTextStyle.textStyle10Regular(
                                context,
                                fontStyle: FontStyle.italic,
                                color: AppColors.black)),
                        const VerticalGap(size: 6),
                        CustomText(
                            text: lineItem.lineItemsMetaData != null &&
                                    lineItem.lineItemsMetaData!.isNotEmpty
                                ? lineItem.lineItemsMetaData![0].displayValue
                                : '',
                            textStyle: CustomTextStyle.textStyle15Bold(context,
                                color: AppColors.black)),
                        const VerticalGap(size: 12),
                        Row(
                          children: [
                            CustomOrangeButton(
                              buttonText: "view".tr,
                              onTapButton: () {},
                              customTextStyle: CustomTextStyle.textStyle16Bold(
                                  context,
                                  color: AppColors.white),
                              radius: 6,
                            ),
                            const HorizontalGap(size: 16),
                            CustomOrangeButton(
                              buttonText: "cancel_request".tr,
                              onTapButton: () {},
                              customTextStyle: CustomTextStyle.textStyle16Bold(
                                  context,
                                  color: AppColors.white),
                              radius: 6,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapCard();
                    },
                    child: SvgPicture.asset(
                      AppAssets.icForwardArrow,
                      width: 30.h,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalGap(size: 8),
          ],
        ),
      ),
    );
  }
}
