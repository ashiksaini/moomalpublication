import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/molecules/custom_btn.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/profile/controller/profile_controller.dart';
import 'package:moomalpublication/features/profile/presentation/template/name_template.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/chip_button.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/profile_picture_card.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Obx(() {
          return Container(
            height: SizeUtils.height,
            color: AppColors.orangeLight1,
            child: Column(
              children: [
                // Appbar
                CustomAppbar(
                  title: 'my_profile'.tr,
                ),

                const VerticalGap(size: 50),

                Center(
                  child: GestureDetector(
                    onTap: () => _profileController.getImageFromGallery(),
                    child: ProfilePicture(
                      avatarUrl: _profileController.userAvatar.value,
                      filePath: _profileController.image.value?.path,
                    ),
                  ),
                ),

                const VerticalGap(size: 20),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                  ),
                  child: NameTemplate(
                    userName: _profileController.userName.value,
                    userEmail: _profileController.userEmail.value,
                  ),
                ),

                const VerticalGap(size: 30),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomChipButton(
                          icon: AppAssets.icOrder,
                          title: "orders".tr,
                          onClick: () =>
                              AppRouting.toNamed(NameRoutes.orderScreen),
                        ),
                      ),
                      const HorizontalGap(size: 20),
                      Expanded(
                        child: CustomChipButton(
                          icon: AppAssets.icAddress,
                          title: "addresses".tr,
                          onClick: () =>
                              AppRouting.toNamed(NameRoutes.addressesScreen),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalGap(size: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomChipButton(
                          icon: AppAssets.icReadingBook,
                          title: "results".tr,
                          onClick: () => AppRouting.toNamed(
                              NameRoutes.overallResultScreen),
                        ),
                      ),
                      const HorizontalGap(size: 20),
                      Expanded(
                        child: CustomChipButton(
                          icon: AppAssets.icInfo,
                          title: "help_center".tr,
                          onClick: () =>
                              AppRouting.toNamed(NameRoutes.contactUsScreen),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 40.v),
                  child: CustomBtn(
                    title: "logout".tr,
                    onTap: () {
                      Get.defaultDialog(
                        backgroundColor: AppColors.white,
                        title: 'Are you sure?',
                        middleText: 'You want to Logout from the Moomal App',
                        middleTextStyle: CustomTextStyle.textStyle16MediumTrio(
                            context,
                            color: AppColors.black),
                        titleStyle: CustomTextStyle.textStyle20BoldCaladea(
                          context,
                          color: AppColors.black,
                        ),
                        textConfirm: 'Logout',
                        textCancel: 'Cancel',
                        confirmTextColor: Colors.white,
                        radius: 10,
                        buttonColor: AppColors.orange,
                        cancelTextColor: AppColors.orange,
                        cancel: GestureDetector(
                          onTap: () {
                            AppRouting.navigateBack();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.v),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.orange),
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Center(
                              child: CustomText(
                                text: "Cancel",
                                textStyle: CustomTextStyle.textStyle14Bold(
                                    context,
                                    color: AppColors.orange),
                              ),
                            ),
                          ),
                        ),
                        confirm: GestureDetector(
                          onTap: () {
                            SharedPreferencesHelper.clearSharedPrefExcept();
                            AppRouting.offAllNamed(NameRoutes.splashScreen);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.v),
                            decoration: BoxDecoration(
                                color: AppColors.orange,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Center(
                              child: CustomText(
                                text: "Logout",
                                textStyle: CustomTextStyle.textStyle14Bold(
                                    context,
                                    color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
