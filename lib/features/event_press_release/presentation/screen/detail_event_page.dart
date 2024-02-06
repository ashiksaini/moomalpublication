import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/routes/routing.dart';

class DetailedEventPage extends StatelessWidget {
  DetailedEventPage({super.key});
  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String appBarTitle = args[0]['appBarTitle'];
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
          child: Container(
          color: AppColors.white,
            child: Stack(
                    children: [
            Column(
              children: [
                CustomAppbar(
                  title: appBarTitle,
                  prefixIcon: AppAssets.icBackArrow,
                  onPrefixIconClick: () => AppRouting.navigateBack(),
                  maxLine: 1,
                ),
                const HorizontalGap(size: 20),
              ],
            ),
                    ],
                  ),
          )),
    );
  }
}
