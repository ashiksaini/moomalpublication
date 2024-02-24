import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/testimonial/data/models/testimonial_response_model.dart';

class StudentGridCard extends StatelessWidget {
  final TestimonialResponseModel testimonialResponseModel;

  const StudentGridCard({super.key, required this.testimonialResponseModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [primaryBoxShadow()],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightblue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.grey),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 40.v,
                    left: 5.h,
                    right: 5.h,
                    bottom: 10.v,
                  ),
                  child: Column(
                    children: [
                      CustomText(
                        text: testimonialResponseModel.spTestimonialClientName,
                        textStyle: CustomTextStyle.textStyle18Bold(
                          context,
                          color: AppColors.black,
                        ),
                      ),
                      CustomText(
                        text:
                            "[${testimonialResponseModel.spTestimonialClientDesignation}]",
                        textStyle: CustomTextStyle.textStyle15Bold(
                          context,
                          color: AppColors.black,
                        ),
                      ),
                      const VerticalGap(size: 20),
                      CustomText(
                        text: testimonialResponseModel.postContent,
                        textStyle: CustomTextStyle.textStyle15Regular(
                          context,
                          color: AppColors.black,
                        ),
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [primaryBoxShadow()], shape: BoxShape.circle),
              child: SvgPicture.asset(
                AppAssets.icTestimonialUser,
                width: 60.h,
                height: 60.v,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
