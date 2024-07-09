import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/latest_news/data/model/latest_news_item1/latest_news_item1/latest_news_item1.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';

class CardLatestNewsItem extends StatelessWidget {
  final LatestNewsItem1 latestNewsItem;

  const CardLatestNewsItem({
    super.key,
    required this.latestNewsItem,
  });

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
        backgroundColor: AppColors.orangeLighter.withOpacity(0.9),
        containerChild: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              CardImage(
                image: latestNewsItem.featuredImageUrl ?? "",
                borderColor: AppColors.grey,
              ),
              const HorizontalGap(size: 16),
              Expanded(
                child: SizedBox(
                  height: 150.v,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Html(data: "<strong>${latestNewsItem.title?.rendered ?? ""}</strong>"),
                      // CustomText(
                      //   text: latestNewsItem.title?.rendered ?? '',
                      //   textStyle: CustomTextStyle.textStyle18BoldCaladea(
                      //     context,
                      //     color: AppColors.black,
                      //   ),
                      //   textAlign: TextAlign.start,
                      // ),
                      const Spacer(),
                      // Html(data: latestNewsItem.content?.rendered ?? ''),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomText(
                          text: 'Read More ...',
                          textStyle: CustomTextStyle.textStyle14Bold(context),
                          maxLines: 4,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
