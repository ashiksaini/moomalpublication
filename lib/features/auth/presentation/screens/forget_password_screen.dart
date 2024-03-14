import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';
import 'package:moomalpublication/features/auth/presentation/template/forget_password_view.dart';
import 'package:moomalpublication/routes/routing.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeUtils.height,
              width: SizeUtils.width,
              child: Stack(
                children: [
                  _bg(context),
                  CustomAppbar(
                    title: "forget_password".tr.replaceFirst("?", ""),
                    bgColor: Colors.transparent,
                    prefixIcon: AppAssets.icBackArrow,
                    onPrefixIconClick: () => AppRouting.navigateBack(),
                  ),
                  ForgetPasswordView(),
                ],
              ),
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
