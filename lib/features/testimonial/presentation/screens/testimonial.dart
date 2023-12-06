import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/testimonial/presentation/templates/testimonial_text.dart';
import 'package:moomalpublication/features/testimonial/presentation/widgets/student_card.dart';

class TestimonialScreen extends StatelessWidget {
  const TestimonialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const CustomAppbar(
              title: "Testomonial", prefixIcon: AppAssets.icBackArrow),
          const VerticalGap(
            size: 30,
          ),
          TestomonialTemplates().testomonialText(context),
          const VerticalGap(
            size: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 340,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 0,
                  ),
                  itemBuilder: (_, index) {
                    return const StudentGridCard(
                        StudentDescriptiontext:
                            "I read read your current GK books on regular basis and I feel very happy when I see many questions in competitive exam papers from your books. Thanks for providing such a great collection of questions.",
                        studentName: "Punit Garg",
                        studentimage: "studentimage");
                  }),
            ),
          ),
        ],
      )),
    );
  }
}
