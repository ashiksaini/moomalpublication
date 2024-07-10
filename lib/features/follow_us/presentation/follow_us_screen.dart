import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/utility.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/contact_us/presentation/widgets/bottom_marker.dart';
import 'package:moomalpublication/routes/routing.dart';

class FollowUsScreen extends StatelessWidget {
  const FollowUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
          child: Container(
        color: AppColors.white1,
        child: Column(
          children: [
            CustomAppbar(
              title: "follow_us".tr,
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
              maxLine: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.v, horizontal: 16.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: ShadowContainer(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.h, vertical: 20.v),
                              // borderColor: AppColors.orange,
                              containerChild: Column(
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.icYoutube1,
                                    height: 70.adaptSize,
                                    width: 70.adaptSize,
                                  ),
                                  const VerticalGap(size: 10),
                                  CustomText(
                                      text: "Youtube",
                                      textStyle:
                                          CustomTextStyle.textStyle16BoldGupter(
                                              context,
                                              color: AppColors.black)),
                                  const VerticalGap(size: 15),
                                  GestureDetector(
                                    onTap: () => Utility.launchurl(
                                        "https://www.youtube.com/channel/UCduYPnmD429wIzMFsiKUmLA"),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.h, vertical: 8.v),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: AppColors.black),
                                      child: Center(
                                        child: CustomText(
                                            text: "Follow us",
                                            textStyle:
                                                CustomTextStyle.textStyle15Bold(
                                                    context,
                                                    color: AppColors.white)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const HorizontalGap(size: 40),
                          Expanded(
                            child: ShadowContainer(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.h, vertical: 20.v),
                              // borderColor: AppColors.orange,
                              containerChild: Column(
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.icFacebook,
                                    height: 70.adaptSize,
                                    width: 70.adaptSize,
                                  ),
                                  const VerticalGap(size: 10),
                                  CustomText(
                                      text: "Facebook",
                                      textStyle:
                                          CustomTextStyle.textStyle16BoldGupter(
                                              context,
                                              color: AppColors.black)),
                                  const VerticalGap(size: 15),
                                  GestureDetector(
                                    onTap: () => Utility.launchurl(
                                        "https://www.facebook.com/moomalpublication/"),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.h, vertical: 8.v),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: AppColors.black),
                                      child: Center(
                                        child: CustomText(
                                            text: "Follow us",
                                            textStyle:
                                                CustomTextStyle.textStyle15Bold(
                                                    context,
                                                    color: AppColors.white)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const VerticalGap(size: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: ShadowContainer(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.h, vertical: 20.v),
                              // borderColor: AppColors.orange,
                              containerChild: Column(
                                children: [
                                  SvgPicture.asset(AppAssets.icTelegram,
                                      height: 70.adaptSize,
                                      width: 70.adaptSize),
                                  const VerticalGap(size: 10),
                                  CustomText(
                                      text: "Telegram",
                                      textStyle:
                                          CustomTextStyle.textStyle16BoldGupter(
                                              context,
                                              color: AppColors.black)),
                                  const VerticalGap(size: 15),
                                  GestureDetector(
                                    onTap: () => Utility.launchurl(
                                        "https://t.me/s/moomalpublication"),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.h, vertical: 8.v),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: AppColors.black),
                                      child: Center(
                                        child: CustomText(
                                            text: "Follow us",
                                            textStyle:
                                                CustomTextStyle.textStyle15Bold(
                                                    context,
                                                    color: AppColors.white)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const HorizontalGap(size: 40),
                          Expanded(
                            child: ShadowContainer(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.h, vertical: 20.v),
                              // borderColor: AppColors.orange,
                              containerChild: Column(
                                children: [
                                  SvgPicture.asset(AppAssets.icWhatsapp,
                                      height: 70.adaptSize,
                                      width: 70.adaptSize),
                                  const VerticalGap(size: 10),
                                  CustomText(
                                      text: "Whatsapp",
                                      textStyle:
                                          CustomTextStyle.textStyle16BoldGupter(
                                              context,
                                              color: AppColors.black)),
                                  const VerticalGap(size: 15),
                                  GestureDetector(
                                    onTap: () =>
                                        Utility.sendToWhatsapp("+917014410554"),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.h, vertical: 8.v),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: AppColors.black),
                                      child: Center(
                                        child: CustomText(
                                            text: "Follow us",
                                            textStyle:
                                                CustomTextStyle.textStyle15Bold(
                                                    context,
                                                    color: AppColors.white)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const BottomMarker(),
          ],
        ),
      )),
    );
  }
}
