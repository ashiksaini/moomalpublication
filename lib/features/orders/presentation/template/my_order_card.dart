import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
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
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class MyOrderCard extends StatelessWidget {
  const MyOrderCard(
      {super.key,
      required this.lineItem,
      this.datePaid,
      required this.onTapCard,
      required this.downloadLinks,
      this.status});
  final LineItem lineItem;
  final DateTime? datePaid;
  final Function onTapCard;
  final List<String> downloadLinks;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.orange_100,
          border: Border.all(
            color: AppColors.grey,
          ),
          boxShadow: [primaryBoxShadow()],
          borderRadius: BorderRadius.all(Radius.circular(
            10.r,
          )),
        ),
        child: Column(
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
                  if (status?.toLowerCase().compareTo("completed") == 0) ...{
                    CustomText(
                        text: '(${status?.toUpperCase() ?? ""})',
                        textStyle: CustomTextStyle.textStyle14Bold(context,
                            color: AppColors.green))
                  } else ...{
                    CustomText(
                        text: '(${status?.toUpperCase() ?? ""})',
                        textStyle: CustomTextStyle.textStyle14Bold(context,
                            color: AppColors.orange))
                  },
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
                            text: lineItem.metaData != null &&
                                    lineItem.metaData!.isNotEmpty
                                ? lineItem.metaData![0].displayValue
                                : '',
                            textStyle: CustomTextStyle.textStyle15Bold(context,
                                color: AppColors.black)),
                        const VerticalGap(size: 12),
                        if (lineItem.ordersMainTabType ==
                            OrdersMainTabType.ebook) ...{
                          CustomOrangeButton(
                            buttonText: "view".tr,
                            onTapButton: () {
                              AppRouting.toNamed(NameRoutes.pdfScreen,
                                  argument: SharedData(
                                      productName: lineItem.name,
                                      productURL: downloadLinks[0]));
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
                              AppRouting.toNamed(NameRoutes.newtestSeriesScreen,
                                  argument: SharedData(
                                      testModel: TestSeriesResponseModel(
                                          id: int.tryParse(
                                              lineItem.metaData?[0].value ??
                                                  "0"),
                                          maximumTime: "180",
                                          postTitle: lineItem.name)));
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
                  SvgPicture.asset(
                    AppAssets.icForwardArrow,
                    width: 30.h,
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
