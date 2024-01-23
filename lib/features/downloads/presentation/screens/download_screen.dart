import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/features/downloads/presentation/template/download_card.dart';
import 'package:moomalpublication/routes/routing.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: "my_downloads".tr,
              maxLine: 1,
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [DownloadCard()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
