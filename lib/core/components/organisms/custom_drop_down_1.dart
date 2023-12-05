import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/molecules/drop_down_item_1.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';

/// Custom Dropdown
/// Parent View ---> Have a background with no boder,
/// Child View ---> Have a divdier between items,
class CustomDropDown1 extends StatelessWidget {
  final List<String> items;
  final Color color;

  const CustomDropDown1(
      {super.key, required this.items, this.color = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        customButton: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(scaleRadius(10, context)),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: scaleWidth(10, context),
            vertical: scaleHeight(13, context),
          ),
          child: Row(
            children: [
              // Title
              CustomText(
                text: items[0],
                textStyle: CustomTextStyle.textStyle18Bold(context),
              ),
              const HorizontalGap(size: 10),

              // DD Icon
              SvgPicture.asset(
                AppAssets.icDropDown,
                height: scaleHeight(20, context),
                width: scaleWidth(20, context),
              ),
            ],
          ),
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: DropDownItem1(title: item),
                ))
            .toList(),
      ),
    );
  }
}
