import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.yellowlighter,
        borderRadius: BorderRadius.all(
          Radius.circular(scaleRadius(5, context)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                child: SvgPicture.asset(
              AppAssets.icCartAdd,
              width: scaleWidth(22, context),
            )),
            const HorizontalGap(size: 10),
            Container(
              // color: Colors.amber,
              child: CustomText(
                textAlign: TextAlign.end,
                text: "Add",
                textStyle: CustomTextStyle.textStyle18Bold(context,
                    color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
