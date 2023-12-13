import 'package:flutter/widgets.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/start_button.dart';

class PhotoDescription extends StatelessWidget {
  const PhotoDescription({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: scaleHeight(12, context),
          left: scaleHeight(10, context),
          right: scaleHeight(10, context),
          bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CardImage(
              image: AppAssets.bookPng,
              borderColor: AppColors.orange,
            ),
          ),
          const VerticalGap(size: 18),
          CustomText(
              textAlign: TextAlign.start,
              text:
                  "Name: Current Affairs Quiz [June 2021] Subject: Current Affairs Topics: All Questions: 25 Objective Type Questions Time Allowed: 25 Minutes Language: Hindi Important for: State PCS, UPSC, IBPS RRB, Police, TGT / PGT, CTET, UPTET, REET, HTET, MPTET, BA, MA, B ed entrance exam, 8th, 9th, 10th, 11th, 12th आदि |",
              textStyle: CustomTextStyle.textStyle18Bold(context)),
          const VerticalGap(size: 18),
          const StartButton(),
        ],
      ),
    );
  }
}
