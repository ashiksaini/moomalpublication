import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/custom_drop_down_1.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class PriceQuantity extends StatelessWidget {
  const PriceQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.orangeLight,
            border: Border.all(color: AppColors.shadow),
            boxShadow: [primaryBoxShadow()],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: scaleWidth(8, context),
                bottom: scaleWidth(8, context),
                left: scaleWidth(21, context),
                right: scaleWidth(21, context)),
            child: CustomText(
              text: "Price : ₹25",
              textStyle: CustomTextStyle.textStyle25Bold(context,
                  color: AppColors.black),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.orangeLight,
            border: Border.all(color: AppColors.shadow),
            boxShadow: [primaryBoxShadow()],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: scaleWidth(21, context), right: scaleWidth(21, context)),
            child: Expanded(
              child: dropDown(
                  ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'], context),
            ),
          ),
        ),
      ],
    );
  }
}

Widget dropDown(List<String> items, BuildContext context) {
  List<String> selectedItems = [];
  return DropdownButtonHideUnderline(
    child: DropdownButton2<String>(
      isExpanded: true,
      hint: Text(
        'Qty: 0',
        style: CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
      ),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          //disable default onTap to avoid closing menu when selecting an item
          enabled: false,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              final isSelected = selectedItems.contains(item);
              return InkWell(
                  onTap: () {
                    isSelected
                        ? selectedItems.remove(item)
                        : selectedItems.add(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    // setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(scaleWidth(4, context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item,
                              style: CustomTextStyle.textStyle25Bold(context,
                                  color: AppColors.black),
                              textAlign: TextAlign.start,
                            ),
                            if (isSelected)
                              Icon(
                                Icons.radio_button_checked_rounded,
                                color: Colors.orange,
                                size: scaleWidth(27, context),
                              )
                            else
                              const Icon(
                                Icons.circle_outlined,
                              ),
                          ],
                        ),
                      ),
                      Divider(
                          height: scaleWidth(2, context),
                          thickness: scaleWidth(1, context)),
                    ],
                  ));
            },
          ),
        );
      }).toList(),
      value: selectedItems.isEmpty ? null : selectedItems.last,
      onChanged: (value) {},
      selectedItemBuilder: (context) {
        return items.map(
          (item) {
            return Container(
              alignment: AlignmentDirectional.center,
              child: Text(
                selectedItems.join(', '),
                style: const TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            );
          },
        ).toList();
      },
      // iconStyleData: const IconStyleData(
      //   icon: Icon(
      //     Icons.arrow_forward_ios_outlined,
      //   ),
      //   iconSize: 14,
      //   iconEnabledColor: Colors.yellow,
      //   iconDisabledColor: Colors.grey,
      // ),
      buttonStyleData: ButtonStyleData(
        padding: EdgeInsets.only(
            right: 0,
            left: scaleWidth(0, context),
            top: scaleWidth(2, context),
            bottom: scaleWidth(2, context)),
        width: scaleWidth(100, context),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.zero,
      ),
    ),
  );
}
