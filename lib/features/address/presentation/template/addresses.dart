import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/address/presentation/widgets/address_card.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: scaleHeight(46, context),
              horizontal: scaleWidth(10, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  textAlign: TextAlign.start,
                  text:
                      "The following addresses will be used on the checkout page by default. ",
                  textStyle: CustomTextStyle.textStyle25Bold(context,
                      color: AppColors.black)),
              const AddressCard(
                  address: "BILLING ADDRESS:",
                  addressHeading:
                      "You have not set up this type of address yet."),
              const AddressCard(
                  address: "SHIPPING ADDRESS:",
                  addressHeading:
                      "You have not set up this type of address yet.")
            ],
          ),
        ),
      ),
    );
  }
}
