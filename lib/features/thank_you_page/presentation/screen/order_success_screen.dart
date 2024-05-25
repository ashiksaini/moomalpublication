import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/thank_you_page/controller/thank_you_controller.dart';
import 'package:moomalpublication/features/thank_you_page/data/models/order_succes_response/order_succes_response.dart';
import 'package:moomalpublication/features/thank_you_page/presentation/template/bill_template.dart';
import 'package:moomalpublication/features/thank_you_page/presentation/template/order_detail_template.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class OrderSuccessScreen extends StatelessWidget {
  OrderSuccessScreen({super.key});
  final OrderSuccessController orderSuccessController =
      Get.put(OrderSuccessController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                colorContainer(
                    child: BillTemplate(
                      orderSuccessResponse:
                          orderSuccessController.orderSuccessData.value,
                    ),
                    context: context),
                const VerticalGap(size: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: colorContainer(
                      child: OrderDetailTemplate(
                          orderSuccessResponse:
                              orderSuccessController.orderSuccessData.value),
                      context: context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.v),
                  child: colorContainer(
                      child: billingContainer(
                          context: context,
                          orderSuccessResponse:
                              orderSuccessController.orderSuccessData.value),
                      context: context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.v, horizontal: 10.h),
                  child: GestureDetector(
                    onTap: () => AppRouting.offAllNamed(NameRoutes.orderScreen),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15.v, horizontal: 10.h),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: 'go_to_orders'.tr, textStyle: CustomTextStyle.textStyle18Bold(context, color: AppColors.black,),),
                          SvgPicture.asset(AppAssets.icArrowRight, height: 18.v, width: 18.h,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget colorContainer(
      {required Widget child, required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.orangeLight,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: child,
    );
  }

  Widget billingContainer(
      {required BuildContext context,
      required OrderSuccessResponse orderSuccessResponse}) {
    return Padding(
      padding: EdgeInsets.only(left: 10.h, right: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.v, left: 4.h),
            child: CustomText(
                text: 'billing_address'.tr,
                textStyle: CustomTextStyle.textStyle20Bold(context,
                    color: AppColors.black)),
          ),
          const VerticalGap(size: 2),
          Divider(
            height: 1.h,
            color: AppColors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.v, left: 12.h, bottom: 18.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: orderSuccessResponse.billingAddress?.name ?? '',
                  textStyle: CustomTextStyle.textStyle16MediumTrio(context,
                      color: AppColors.black),
                ),
                CustomText(
                    text: orderSuccessResponse.billingAddress?.address ?? '',
                    textStyle: CustomTextStyle.textStyle16MediumTrio(context,
                        color: AppColors.black)),
                CustomText(
                    text: orderSuccessResponse.billingAddress?.state ?? '',
                    textStyle: CustomTextStyle.textStyle16MediumTrio(context,
                        color: AppColors.black)),
                CustomText(
                    text: orderSuccessResponse.billingAddress?.mobile ?? '',
                    textStyle: CustomTextStyle.textStyle16MediumTrio(context,
                        color: AppColors.black)),
                CustomText(
                    text: orderSuccessResponse.billingAddress?.email ?? '',
                    textStyle: CustomTextStyle.textStyle16MediumTrio(context,
                        color: AppColors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
