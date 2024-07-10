import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/downloader.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/latest_news/data/model/latest_news_item1/latest_news_item1/latest_news_item1.dart';

class PdfDownloadCard extends StatelessWidget {
  final LatestNewsItem1 latestNewsItem;
  const PdfDownloadCard({super.key, required this.latestNewsItem});

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      containerChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 12.v),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.icPdf,
              height: 32.v,
              width: 32.h,
            ),
            HorizontalGap(size: 20.h),
            Expanded(
                child: Html(
                    data:
                        "<strong>${latestNewsItem.title?.rendered ?? ""}</strong>")),
            GestureDetector(
              onTap: () {
                Donwloader.downloadFile(latestNewsItem.title?.rendered?.toString() ?? "", latestNewsItem.featuredImageUrl ?? "");
              },
              child: SvgPicture.asset(
                AppAssets.icDownload,
                height: 32.v,
                width: 32.h,
                color: AppColors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
