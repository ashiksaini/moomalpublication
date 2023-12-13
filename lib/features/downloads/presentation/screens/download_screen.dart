import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/features/downloads/presentation/template/download_card.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: "My Downloads",
              maxLine: 1,
              prefixIcon: AppAssets.icBackArrow,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DownloadCard()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
