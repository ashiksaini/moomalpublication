import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/molecules/auth_btn.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_decorations.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/text_fields.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: NoGlowBehavior(),
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight(context),
            padding: EdgeInsets.symmetric(horizontal: scaleWidth(24, context)),
            decoration: BoxDecoration(
              gradient: gradientBg(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.icLogo1,
                  height: scaleHeight(195, context),
                  width: scaleWidth(195, context),
                ),
                const VerticalGap(size: 69),
                customTextFormField(context, hint: "username".tr, prefixIcon: AppAssets.icUser),
                const VerticalGap(size: 38),
                customTextFormField(context, hint: "password".tr, prefixIcon: AppAssets.icPassword),
                const VerticalGap(size: 17),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(text: "forget_password".tr, textStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.white)),
                ),
                const VerticalGap(size: 39),
                AuthBtn(title: "login".tr),
                const VerticalGap(size: 20),
                AuthBtn(title: "register".tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
