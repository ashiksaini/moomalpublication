import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class StarRatingBar extends StatelessWidget {
  final bool ignoreGesture;
  final double itemSize;
  final double? initialRating;
  final Function? onRatingUpdate;

  const StarRatingBar({
    super.key,
    this.initialRating,
    this.ignoreGesture = false,
    this.onRatingUpdate,
    required this.itemSize,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      glow: false,
      initialRating: initialRating ?? 0,
      itemSize: scaleWidth(itemSize, context),
      direction: Axis.horizontal,
      ignoreGestures: ignoreGesture,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: _image(AppAssets.icStar),
        half: _image(AppAssets.icBorderedStar),
        empty: _image(AppAssets.icBorderedStar),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: scaleWidth(1, context)),
      onRatingUpdate: (rating) =>
          onRatingUpdate != null ? onRatingUpdate!(rating) : null,
    );
  }
}

Widget _image(String asset) {
  return SvgPicture.asset(
    asset,
  );
}
