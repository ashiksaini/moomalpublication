import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class StudentGridCard extends StatelessWidget {
  final String studentDescriptiontext;
  final String studentName;
  final String studentimage;
  const StudentGridCard(
      {super.key,
      required this.studentDescriptiontext,
      required this.studentName,
      required this.studentimage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Padding(
          padding: EdgeInsets.only(top: scaleWidth(24, context)),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightblue,
              borderRadius: BorderRadius.circular(scaleRadius(10, context)),
              border: Border.all(color: AppColors.grey),
              boxShadow: [primaryBoxShadow()],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: scaleWidth(44, context),
                  left: scaleWidth(5, context),
                  right: scaleWidth(5, context),
                  bottom: scaleWidth(20, context)),
              child: Column(
                children: [
                  Text(
                    studentName,
                    style: CustomTextStyle.textStyle18Bold(context,
                        color: AppColors.black),
                  ),
                  Text("[Student]",
                      style: CustomTextStyle.textStyle15Bold(context,
                          color: AppColors.black)),
                  const VerticalGap(size: 31),
                  Text(
                    studentDescriptiontext,
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.textStyle15Medium(
                      context,
                      color: AppColors.black,
                    ),
                    maxLines: 7,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 0,
            child: Image.asset(
              AppAssets.studentProfile,
              width: scaleWidth(60, context),
            )),
      ]),
    );
  }
}
