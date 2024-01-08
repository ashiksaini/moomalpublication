import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/molecules/custom_btn.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class EmptyCartView extends StatelessWidget {
  final String title;

  const EmptyCartView({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppAssets.icBox),
        const VerticalGap(size: 25),
        CustomText(
          text: title,
          textStyle: CustomTextStyle.textStyle25Bold(context),
        ),
        const VerticalGap(size: 30),
        CustomBtn(
          title: "browse_product".tr,
          onTap: () => AppRouting.offAndToNamed(
            NameRoutes.moomalpublicationApp,
            argument: 1,
          ),
        ).paddingSymmetric(
          horizontal: scaleWidth(40, context),
        ),
      ],
    );
  }
}
