import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/testimonial/controllers/testimonial_controller.dart';
import 'package:moomalpublication/features/testimonial/presentation/templates/student_card.dart';
import 'package:moomalpublication/features/testimonial/presentation/widgets/testimonial_text.dart';

class TestimonialScreen extends StatelessWidget {
  TestimonialScreen({super.key});
  final TestimonialController _testimonialController =
      Get.put(TestimonialController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const CustomAppbar(
              title: "Testomonial", prefixIcon: AppAssets.icBackArrow),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const VerticalGap(
                    size: 30,
                  ),
                  TestomonialTemplates().testomonialText(context),
                  const VerticalGap(
                    size: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: scaleWidth(340, context),
                          crossAxisSpacing: scaleWidth(12, context),
                          mainAxisSpacing: scaleWidth(36, context),
                        ),
                        itemBuilder: (_, index) {
                          return const StudentGridCard(
                              studentDescriptiontext:
                                  "I read read your current GK books on regular basis and I feel very happy when I see many questions in competitive exam papers from your books. Thanks for providing such a great collection of questions.",
                              studentName: "Punit Garg",
                              studentimage: "studentimage");
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
