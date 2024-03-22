import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/box_decorations.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/splash/presentation/template/splash_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeUtils.height,
        width: SizeUtils.width,
        child: Stack(
          children: [
            _bg(context),
            SplashView(),
          ],
        ),
      ),
    );
  }

  Widget _bg(BuildContext context) {
    return Container(
      width: SizeUtils.width,
      height: SizeUtils.height,
      decoration: BoxDecoration(
        gradient: gradientBg(context),
      ),
    );
  }
}
