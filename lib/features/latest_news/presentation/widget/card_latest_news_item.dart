import 'package:flutter/widgets.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/latest_news/data/model/latest_news_item/latest_news_item.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';

class CardLatestNewsItem extends StatelessWidget {
  final LatestNewsItem latestNewsItem;

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
                image: latestNewsItem.featuredImage?.thumbnail ?? "",
                borderColor: AppColors.grey,
              ),
              const HorizontalGap(size: 16),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: latestNewsItem.title,
                      textStyle: CustomTextStyle.textStyle18BoldCaladea(
                        context,
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const VerticalGap(size: 10),
                    CustomText(
                      text: latestNewsItem.content,
                      textStyle:
                          CustomTextStyle.textStyle18BoldCaladea(context),
                      maxLines: 4,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
