import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/address/presentation/widgets/add.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key,required this.address,required this.addressHeading});
  final String addressHeading;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalGap(size: 20),
        CustomText(
            textAlign: TextAlign.start,
            text: addressHeading,
            textStyle: CustomTextStyle.textStyle30Bold(
              context,
              color: AppColors.black,
              decoration: TextDecoration.underline,
            )),
        const VerticalGap(size: 10),
        CustomText(
            textAlign: TextAlign.start,
            text: address,
            textStyle: CustomTextStyle.textStyle25Bold(context,
                color: AppColors.black)),
        const VerticalGap(size: 10),
        const AddButton(),
      ],
    );
  }
}
