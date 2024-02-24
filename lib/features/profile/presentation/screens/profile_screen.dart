import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/profile/controller/profile_controller.dart';
import 'package:moomalpublication/features/profile/presentation/template/name_template.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/cirular_conatiner.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/profile_picture_card.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            return Container(
              height: SizeUtils.height,
              color: AppColors.white,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 280.v,
                      ),
                      const CircularContainer(),
                      CustomAppbar(
                        title: "my_profile".tr,
                        maxLine: 1,
                        textAlign: TextAlign.center,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 120.h,
                        child: ProfilePicture(
                            avatarUrl: _profileController.userAvatar.value),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 56.v,
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
      ),
    );
  }
}
