import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/date_time_utils.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/downloads/data/model/download_response_model/download_response_model.dart';
import 'package:moomalpublication/features/orders/presentation/template/text_card.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class DownloadCard extends StatelessWidget {
  const DownloadCard({super.key, required this.downloadList});
  final List<DownloadResponseModel> downloadList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: scaleHeight(30, context),
            horizontal: scaleWidth(8, context)),
        child: Obx(
          () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: downloadList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      AppRouting.toNamed(NameRoutes.pdfScreen);
                    },
                    child: ShadowContainer(
                        backgroundColor:
                            AppColors.orangeLighter.withOpacity(0.9),
                        containerChild: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            children: [
                              downloadList[index].imageUrl == false
                                  ? const CardImage(
                                      image: AppAssets.bookPng,
                                      borderColor: AppColors.grey,
                                    )
                                  : CardImage(
                                      assetsImage: false,
                                      image: downloadList[index].imageUrl,
                                      borderColor: AppColors.grey,
                                    ),
                              const HorizontalGap(size: 16),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextCard(
                                        name: 'name'.tr,
                                        subject:
                                            downloadList[index].productName ??
                                                ''),
                                    TextCard(
                                      name: 'date_paid'.tr,
                                      subject: DateTimeUtils.formatDateTime(
                                        inputDateString: downloadList[index]
                                                .dateOfPurchase ??
                                            '2024-01-19 07:44:59', // ask
                                        outputFormat:
                                            AppConstants.dateFormatter,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                );
              }),
        ));
  }
}
