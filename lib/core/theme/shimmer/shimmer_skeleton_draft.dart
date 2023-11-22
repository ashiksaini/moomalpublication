// import 'package:auriga_one/core/theme/colors.dart';
// import 'package:auriga_one/core/theme/dimen.dart';
// import 'package:auriga_one/core/utils/horizontal_space.dart';
// import 'package:auriga_one/core/utils/vertical_space.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class ShimmerSkeletonDraft extends StatelessWidget {
//   const ShimmerSkeletonDraft ({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: AppColors.bffffff,
//       highlightColor: AppColors.fFFFFFF,
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: scaleWidth(16, context),
//           vertical: scaleHeight(20, context),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // header of card
//             _headerofCard(context),
//             const VerticalGap(size: 16),
//             // Long text
//             _roundedRow(context, 20, double.infinity),
//             _roundedRow(context, 20, 300),
//             _roundedRow(context, 20, double.infinity),

//             const VerticalGap(size: 15),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _headerofCard(
//   BuildContext context,
// ) {
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       // profile and center Data
//       Expanded(
//         child: Row(
//           children: [
//             // profile image
//             _profileImage(context),
//             const HorizontalGap(size: 6.5),
//             _centerColoumnofHeader(context),
//           ],
//         ),
//       ),
//       // Three Dots
//     ],
//   );
// }

// Widget _profileImage(BuildContext context) {
//   return CircleAvatar(
//     radius: scaleRadius(28.5, context),
//     child: Container(
//       height: scaleHeight(24, context),
//     ),
//   );
// }

// Widget _centerColoumnofHeader(BuildContext context) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       // headerText and new button
//       _roundedRow(context, 20, 150),
//       // Day and date
//       _roundedRow(context, 20, 115),
//     ],
//   );
// }


// Widget _roundedRow(BuildContext context, double height, double width) {
//   return SizedBox(
//     // color: AppColors.bFFFFFF,
//     height: scaleHeight(height, context),
//     width: scaleWidth(width, context),
//     child: Card(
//       elevation: 1.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(scaleRadius(22, context)),
//       ),
//       child: SizedBox(
//         height: scaleHeight(20, context),
//       ),
//     ),
//   );
// }
