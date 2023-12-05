import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class StudentGridCard extends StatelessWidget {
  final String StudentDescriptiontext;
  final String studentName;
  final String studentimage;
  const StudentGridCard(
      {super.key,
      required this.StudentDescriptiontext,
      required this.studentName,
      required this.studentimage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: AppColors.lightblue,
            borderRadius: BorderRadius.circular(scaleRadius(20, context)),
            border: Border.all(color: AppColors.grey),
            boxShadow: [primaryBoxShadow()],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 20),
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
                  StudentDescriptiontext,
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
        Positioned(top: 6, child: SvgPicture.asset(AppAssets.icProfile)),
      ]),
    );
  }
}
