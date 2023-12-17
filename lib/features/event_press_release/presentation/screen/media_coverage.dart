import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class MediaCoverage extends StatelessWidget {
  const MediaCoverage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(24, context)),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: scaleWidth(20, context),
                    ),
                    child: CustomText(
                        text: "MEDIA BOOKS",
                        textStyle: CustomTextStyle.textStyle20Bold(context,
                            color: AppColors.black,
                            decoration: TextDecoration.underline)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: scaleWidth(10, context),
                        vertical: scaleHeight(20, context)),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 12.0,
                        childAspectRatio: 0.49,
                      ),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Container(
                          color: AppColors.orangeSkin,
                          // child: SvgPicture.asset(
                          //   image,
                          //   width: scaleWidth(184, context),
                          //   height: scaleHeight(245, context),
                          // ),
                          child: Image.asset(
                            AppAssets.bookPng,
                            width: scaleWidth(245, context),
                            height: scaleHeight(245, context),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: scaleWidth(20, context),
                        bottom: scaleHeight(12, context)),
                    child: CustomText(
                        text: "MEDIA VIDEOS",
                        textStyle: CustomTextStyle.textStyle20Bold(context,
                            color: AppColors.black,
                            decoration: TextDecoration.underline)),
                  ),
                  Image.asset(
                    AppAssets.bookPng,
                    width: scaleWidth(245, context),
                    height: scaleHeight(245, context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
