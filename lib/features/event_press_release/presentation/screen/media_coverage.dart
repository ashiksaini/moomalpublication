import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
      padding: EdgeInsets.symmetric(vertical: 24.v),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                    ),
                    child: CustomText(
                        text: "media_books".tr,
                        textStyle: CustomTextStyle.textStyle20Bold(context,
                            color: AppColors.black,
                            decoration: TextDecoration.underline)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.v),
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
                          //   width: 184.h,
                          //   height: 245.v,
                          // ),
                          child: SvgPicture.asset(
                            AppAssets.bookImg,
                            width: 245.h,
                            height: 245.v,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.h, bottom: 12.v),
                    child: CustomText(
                        text: "media_videos".tr,
                        textStyle: CustomTextStyle.textStyle20Bold(context,
                            color: AppColors.black,
                            decoration: TextDecoration.underline)),
                  ),
                  SvgPicture.asset(
                    AppAssets.bookImg,
                    width: 245.h,
                    height: 245.v,
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
