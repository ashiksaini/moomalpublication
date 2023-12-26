import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/quiz/presentation/template/photo_description.dart';

class CurrentAffair extends StatelessWidget {
  const CurrentAffair({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppbar(
              title: "Current Affair Quiz June 2021",
              maxLine: 1,
              prefixIcon: AppAssets.icBackArrow,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: scaleHeight(30, context),
                      horizontal: scaleWidth(30, context)),
                  child: const ShadowContainer(
                    containerChild: PhotoDescription(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
