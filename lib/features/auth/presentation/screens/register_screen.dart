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
      height: SizeUtils.height,
            width: SizeUtils.width,
            child: Stack(
              children: [
                _bg(context),
                RegisterView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bg(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.bgAuth,
      height: SizeUtils.height,
      width: SizeUtils.width,
      fit: BoxFit.cover,
    );
  }
}
