import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';
import 'package:moomalpublication/features/auth/presentation/template/register_view.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                RegisterView(),
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
