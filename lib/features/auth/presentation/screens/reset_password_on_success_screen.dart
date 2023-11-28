import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';
import 'package:moomalpublication/features/auth/presentation/templates/reset_password_on_success_view.dart';

class ResetPasswordOnSuccessScreen extends StatelessWidget {
  const ResetPasswordOnSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: NoGlowBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight(context),
            width: screenWidth(context),
            child: Stack(
              children: [
                _bg(),
                const ResetPasswordOnSuccessView(),
              ],
            ),
          ),
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