import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/testimonial/controllers/testimonial_controller.dart';
import 'package:moomalpublication/features/testimonial/presentation/templates/student_card.dart';
import 'package:moomalpublication/features/testimonial/presentation/widgets/testimonial_text.dart';
import 'package:moomalpublication/routes/routing.dart';

class TestimonialScreen extends StatelessWidget {
  TestimonialScreen({super.key});

  final TestimonialController _testimonialController = Get.put(TestimonialController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              CustomAppbar(
                title: "testimonial".tr,
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const TestomonialTemplates(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: scaleHeight(10, context),
                          horizontal: scaleWidth(10, context),
                        ),
                        child: (_testimonialController.testimonialResponse.value.isLoading)
                            ? customProgressIndicator()
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _testimonialController.testimonials.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.5,
                                  crossAxisSpacing: scaleWidth(10, context),
                                  mainAxisSpacing: scaleHeight(30, context),
                                ),
                                itemBuilder: (_, index) {
                                  return StudentGridCard(
                                    testimonialResponseModel: _testimonialController.testimonials[index],
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
