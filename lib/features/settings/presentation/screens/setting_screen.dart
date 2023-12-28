import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/settings/controller/setting_controller.dart';
import 'package:moomalpublication/features/settings/presentation/template/setting_card.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final SettingController _settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: "setting".tr,
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: scaleWidth(15, context), vertical: scaleHeight(24, context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Shipping Policy
                      SettingCard(
                        text: 'shipping_policy'.tr.toUpperCase(),
                        onCardTap: () {
                          _settingController.navigateSettingDetailScreen(
                            appBarTitle: 'shipping_policy'.tr.toUpperCase(),
                            description: 'shipping_policy_desc'.tr,
                          );
                        },
                      ),
                      const VerticalGap(size: 20),

                      // Cancellation and refund policy
                      SettingCard(
                        text: 'cancellation_and_refund_policy'.tr.toUpperCase(),
                        onCardTap: () {
                          _settingController.navigateSettingDetailScreen(
                            appBarTitle: 'cancellation_and_refund_policy'.tr.toUpperCase(),
                            description: 'cancellation_and_refund_policy_desc'.tr,
                          );
                        },
                      ),
                      const VerticalGap(size: 20),

                      // Privacy Policy
                      SettingCard(
                        text: 'privacy_policy'.tr.toUpperCase(),
                        onCardTap: () {
                          _settingController.navigateSettingDetailScreen(
                            appBarTitle: 'privacy_policy'.tr.toUpperCase(),
                            description: 'cancellation_and_refund_policy_desc'.tr,
                          );
                        },
                      ),
                      const VerticalGap(size: 20),

                      // Terms and condition
                      SettingCard(
                        text: 'terms_and_conditions'.tr.toUpperCase(),
                        onCardTap: () {
                          _settingController.navigateSettingDetailScreen(
                            appBarTitle: 'terms_and_conditions'.tr.toUpperCase(),
                            description: 'terms_and_conditions_desc'.tr,
                          );
                        },
                      ),
                      const VerticalGap(size: 20),

                      // Logout
                      SettingCard(
                        text: 'logout'.tr.toUpperCase(),
                        color: AppColors.orange,
                        onCardTap: () {
                          SharedPreferencesHelper.clearSharedPrefExcept();
                          AppRouting.offAllNamed(NameRoutes.splashScreen);
                        },
                      ),
                      const VerticalGap(size: 20),

                      // Delete Account
                      SettingCard(
                        text: 'delete_account'.tr.toUpperCase(),
                        color: AppColors.red,
                        onCardTap: () {
                          _settingController.deleteUserAccount();
                        },
                      ),
                      const VerticalGap(size: 20),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
