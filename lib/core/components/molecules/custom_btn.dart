// import 'package:flutter/material.dart';
// import 'package:moomalpublication/core/components/atoms/custom_text.dart';
// import 'package:moomalpublication/core/theme/colors.dart';
// import 'package:moomalpublication/core/theme/custom_text_style.dart';
// import 'package:moomalpublication/core/theme/dimen.dart';

// class CustomBtn extends StatelessWidget {
//   final String title;
//   final Color? color;
//   final Function? onTap;
//   final Color? bgColor;

//   const CustomBtn({
//     Key? key,
//     required this.title,
//     this.color,
//     this.bgColor,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: InkWell(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//           onTap!();
//         },
//         child: Ink(
//           child: Container(
//             padding: EdgeInsets.symmetric(
//               vertical: scaleHeight(14, context),
//             ),
//             decoration: BoxDecoration(
//                 color: bgColor ?? AppColors.f11a6a1,
//                 borderRadius: BorderRadius.circular(
//                   scaleRadius(7, context),
//                 ),
//                 boxShadow: const [BoxShadow(offset: Offset(3, 3), blurRadius: 2, color: AppColors.shadowColor)]),
//             child: Center(
//               child: CustomText(
//                 text: title,
//                 textStyle: CustomTextStyle.textStyle14Medium(context, color: AppColors.fFFFFFF),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
