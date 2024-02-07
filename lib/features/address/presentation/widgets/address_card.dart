import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/billing_address.dart';
import 'package:moomalpublication/core/base/shipping_address.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/address/presentation/widgets/add.dart';

class AddressCard extends StatelessWidget {
  final String addressHeading;
  final dynamic address;
  final Function? onTap;

  late final BillingAddress billingAddress;
  late final ShippingAddress shippingAddress;
  late final String? addressValue;

  AddressCard({
    super.key,
    required this.address,
    required this.addressHeading,
    this.onTap,
  }) {
    if (address is BillingAddress) {
      billingAddress = address;

      if (billingAddress.firstName?.isNotEmpty == true) {
        addressValue =
            "${billingAddress.firstName} ${billingAddress.lastName}\n${billingAddress.address1}, ${billingAddress.city}, ${billingAddress.state}-${billingAddress.postcode}\n${billingAddress.phone}";
      } else {
        addressValue = null;
      }
    } else if (address is ShippingAddress) {
      shippingAddress = address;

      if (shippingAddress.firstName?.isNotEmpty == true) {
        addressValue =
            "${shippingAddress.firstName} ${shippingAddress.lastName}\n${shippingAddress.address1}, ${shippingAddress.city} ,${shippingAddress.state}-${shippingAddress.postcode}";
      } else {
        addressValue = null;
      }
    } else {
      addressValue = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalGap(size: 20),
        CustomText(
          textAlign: TextAlign.start,
          text: '$addressHeading :',
          textStyle: CustomTextStyle.textStyle30Bold(
            context,
            color: AppColors.black,
            decoration: TextDecoration.underline,
          ),
        ),
        const VerticalGap(size: 10),
        CustomText(
          textAlign: TextAlign.start,
          text:
              addressValue ?? "you_have_not_set_up_this_type_of_address_yet".tr,
          textStyle:
              CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
        ),
        const VerticalGap(size: 10),
        CustomOrangeButton(
          buttonText: addressValue != null ? "update".tr : "add".tr,
          onTapButton: onTap ?? () {},
        ),
      ],
    );
  }
}
