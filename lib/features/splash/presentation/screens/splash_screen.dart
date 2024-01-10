import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/splash/presentation/template/splash_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            _bg(),
            SplashView(),
          ],
        ),
      ),
    );
  }

  Widget _bg() {
    return SvgPicture.asset(
      AppAssets.bgAuth,
      fit: BoxFit.fill,
    );
  }
}
