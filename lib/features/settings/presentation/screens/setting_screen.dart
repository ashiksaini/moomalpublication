import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/molecules/no_glow_behaviour.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/contact_us/presentation/widgets/bottom_contact_bar.dart';
import 'package:moomalpublication/features/settings/controller/setting_controller.dart';
import 'package:moomalpublication/features/settings/presentation/template/setting_card.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const CustomAppbar(
            title: "Setting",
            prefixIcon: AppAssets.icBackArrow,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: NoGlowBehavior(),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: scaleWidth(16, context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SettingCard(
                            text: 'SHIPPING POLICY',
                            onCardTap: () {
                              settingController.navigateSettingDetailScreen(
                                appBarTitle: 'SHIPPING POLICY',
                                description: '',
                              );
                            },
                          ),
                          SettingCard(
                            text: 'CANCELLATION & REFUND POLICY',
                            onCardTap: () {
                              settingController.navigateSettingDetailScreen(
                                appBarTitle: 'CANCELLATION & REFUND POLICY',
                                description: '',
                              );
                            },
                          ),
                          SettingCard(
                            text: 'PRIVACY POLICY',
                            onCardTap: () {
                              settingController.navigateSettingDetailScreen(
                                appBarTitle: 'PRIVACY POLICY',
                                description: '',
                              );
                            },
                          ),
                          SettingCard(
                            text: 'TERMS & CONDITIONS',
                            onCardTap: () {
                              settingController.navigateSettingDetailScreen(
                                appBarTitle: 'TERMS & CONDITIONS',
                                description: '',
                              );
                            },
                          ),
                          SettingCard(
                            text: 'LOGOUT',
                            color: AppColors.orange,
                            onCardTap: () {
                              settingController.navigateSettingDetailScreen(
                                appBarTitle: 'LOGOUT',
                                description: '',
                              );
                            },
                          ),
                        ],
                      ),
                      BottomDetailBar(
                        showSocial: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
