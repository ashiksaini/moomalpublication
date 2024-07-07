import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';

class PdfDownloadCard extends StatelessWidget {
  final String pdfText;
  final Function onClickDownload;
  const PdfDownloadCard(
      {super.key, required this.pdfText, required this.onClickDownload});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 12.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.icPdf,
                height: 32.v,
                width: 32.h,
              ),
              HorizontalGap(size: 20.h),
              Text(
                pdfText,
                style: CustomTextStyle.textStyle22Bold(context,
                    color: AppColors.black),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              onClickDownload();
            },
            child: SvgPicture.asset(
              AppAssets.icDownload,
              height: 32.v,
              width: 32.h,
              color: AppColors.black.withOpacity(0.86),
            ),
          ),
        ],
      ),
    );
  }
}
