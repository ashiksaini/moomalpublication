import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/profile/controller/profile_controller.dart';
import 'package:moomalpublication/features/profile/presentation/template/name_template.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/chip_button.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/cirular_conatiner.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/profile_picture_card.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

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
                Stack(
                  children: [
                    Column(
                      children: [
                        const CircularContainer(),
                        Container(
                          height: 80.v,
                        )
                      ],
                    ),
                    Positioned(
                      top: 120.v,
                      left: 0.h,
                      right: 0.h,
                      bottom: 0.v,
                      child: Center(
                        child: ProfilePicture(
                          avatarUrl: _profileController.userAvatar.value,
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalGap(size: 20),
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                    vertical: 24.v,
                  ),
                  child: NameTemplate(
                    userName: _profileController.userName.value,
                    userEmail: _profileController.userEmail.value,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
