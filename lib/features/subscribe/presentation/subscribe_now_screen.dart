import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/molecules/auth_btn.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_decorations.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/subscribe/controller/subscribe_controller.dart';
import 'package:moomalpublication/routes/routing.dart';

class SubscribeNowScreen extends StatelessWidget {
  SubscribeNowScreen({super.key});

  final SubscribeController _subscribeController =
      Get.put(SubscribeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Container(
          height: SizeUtils.height,
          width: SizeUtils.width,
          decoration: BoxDecoration(gradient: gradientBg(context)),
          child: SafeArea(
            child: Column(
              children: [
                CustomAppbar(
                  title: "news_letter".tr,
                  prefixIcon: AppAssets.icBackArrow,
                  bgColor: Colors.transparent,
                  onPrefixIconClick: () => AppRouting.navigateBack(),
                ),
                VerticalGap(size: 100.v),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 14.v),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppAssets.icLogo,
                        height: 190.v,
                        width: 190.h,
                      ),
                      VerticalGap(size: 50.v),
                      CustomText(
                        text: "news_letter".tr,
                        textStyle: CustomTextStyle.textStyle30BoldCaladea(
                          context,
                          color: AppColors.black,
                        ),
                      ),
                      VerticalGap(size: 20.v),
                      CustomText(
                        text: "news_letter_desc".tr,
                        textStyle: CustomTextStyle.textStyle18BoldCaladea(
                          context,
                          color: AppColors.black,
                        ),
                      ),
                      VerticalGap(size: 50.v),
                      AuthBtn(
                        title: "subscribe_now",
                        onClick: () {
                          if (!_subscribeController.subscribeResponse.value.isLoading) {
                            _subscribeController.onSubscribe();
                          }
                        },
                        isLoadingVisible:
                            _subscribeController.subscribeResponse.value.isLoading,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
