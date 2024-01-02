import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/features/test_series/presentation/template/test_data_card.dart';
import 'package:moomalpublication/routes/routing.dart';

class OnlineTestSeries extends StatelessWidget {
  const OnlineTestSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              title: "Online Test Series",
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
              maxLine: 1,
            ),
            const Expanded(child: SingleChildScrollView(child: TestDataCard())),
          ],
        ),
      ),
    );
  }
}
