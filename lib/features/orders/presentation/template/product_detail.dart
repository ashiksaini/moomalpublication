import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/date_time_utils.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/address/presentation/widgets/add.dart';
import 'package:moomalpublication/features/orders/data/constants/enums.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model1/line_item.dart';
import 'package:moomalpublication/features/orders/presentation/widgets/image_container.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class ProductDetailCard extends StatelessWidget {
  const ProductDetailCard(
      {super.key, required this.lineItem, required this.datePaid});
  final LineItem lineItem;
  final String datePaid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageContainer(
                image: lineItem.image!.src ?? '',
                height: 200.v,
                width: 150.h,
              ),
              const HorizontalGap(size: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: lineItem.name,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        textStyle: CustomTextStyle.textStyle20Bold(context,
                            color: AppColors.black)),
                    CustomText(
                        text: '₹${lineItem.price}',
                        textStyle: CustomTextStyle.textStyle20Bold(context,
                            color: AppColors.black)),
                    CustomText(
                        text: DateTimeUtils.formatDateTime(
                          inputDateString: datePaid,
                          outputFormat: AppConstants.dateFormatter,
                        ),
                        textStyle: CustomTextStyle.textStyle14Regular(
                          context,
                          fontStyle: FontStyle.italic,
                          color: AppColors.black,
                        )),
                    const VerticalGap(size: 10),
                    if (lineItem.ordersMainTabType ==
                        OrdersMainTabType.ebook) ...{
                      CustomOrangeButton(
                        buttonText: "view".tr,
                        onTapButton: () {
                          AppRouting.toNamed(NameRoutes.pdfScreen,
                              argument: SharedData(
                                  productName: lineItem.name,
                                  productURL: lineItem.link));
                        },
                        customTextStyle: CustomTextStyle.textStyle16Bold(
                            context,
                            color: AppColors.white),
                        radius: 6,
                      )
                    } else if (lineItem.ordersMainTabType ==
                        OrdersMainTabType.test) ...{
                      CustomOrangeButton(
                        buttonText: "start_test".tr,
                        onTapButton: () {
                          AppRouting.toNamed(NameRoutes.webView,
                              argument: SharedData(
                                  productName: lineItem.name,
                                  productURL: lineItem.link));
                        },
                        customTextStyle: CustomTextStyle.textStyle16Bold(
                            context,
                            color: AppColors.white),
                        radius: 6,
                      )
                    },
                  ],
                ),
              ),
            ],
          ),
          const VerticalGap(size: 18),
        ],
      ),
    );
  }
}
