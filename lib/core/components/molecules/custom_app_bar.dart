// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:sam_construction/core/components/atoms/custom_text.dart';
// import 'package:sam_construction/core/constants/assets.dart';
// import 'package:sam_construction/core/theme/colors.dart';
// import 'package:sam_construction/core/theme/custom_text_style.dart';
// import 'package:sam_construction/core/theme/dimen.dart';
// import 'package:sam_construction/routes/routing.dart';
// import '../../utils/horizontal_space.dart';

// class CustomAppBar extends StatelessWidget {
//   final String? text;
//   final String? btnText;
//   // final String icon;
//   final void Function()? onClick;
//   final void Function()? onIconClick;

//   const CustomAppBar({
//     super.key,
//     this.text,
//     this.btnText,
//     // this.icon = AppAssets.backIcon,
//     this.onClick,
//     this.onIconClick,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         // color: AppColors.f07182C,
//         border: Border(
//           // bottom: BorderSide(color: AppColors.f182C44),
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: scaleWidth(16, context),
//           vertical: scaleHeight(18, context),
//         ),
//         child: Row(
//           children: [
//             GestureDetector(
//               onTap: onIconClick ?? () => AppRouting.navigateBack(),
//               child: SvgPicture.asset(
//                 "icon",
//               ),
//             ),
//             const HorizontalGap(size: 19),
//             Expanded(
//               child: CustomText(
//                 text: text,
//                 textStyle: CustomTextStyle.textStyle16SemiBold(context),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//             GestureDetector(
//               onTap: onClick,
//               child: CustomText(
//                 text: btnText,
//                 textStyle: CustomTextStyle.textStyle14Bold(
//                   context,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
