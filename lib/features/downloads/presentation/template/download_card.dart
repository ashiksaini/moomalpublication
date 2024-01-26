import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/downloads/data/controller/download_controller.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class DownloadCard extends StatelessWidget {
  DownloadCard({super.key});
  final DownloadController downloadController = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: scaleHeight(30, context),
            horizontal: scaleWidth(8, context)),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    AppRouting.toNamed(NameRoutes.pdfScreen);
                  },
                  child: ShadowContainer(
                      backgroundColor: AppColors.orangeLighter.withOpacity(0.9),
                      containerChild: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          children: [
                            const CardImage(
                              image: AppAssets.bookPng,
                              borderColor: AppColors.grey,
                            ),
                            const HorizontalGap(size: 16),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      textAlign: TextAlign.start,
                                      text: "Current Affairs 1 Liner",
                                      textStyle:
                                          CustomTextStyle.textStyle25Bold(
                                              context)),
                                  const VerticalGap(size: 30),
                                  // const DeleteButton()
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              );
            }));
  }
}
