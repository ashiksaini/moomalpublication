import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/address/data/models/address_model.dart';

class AdressController extends BaseController {
  RxList<AddressTextEditingController> billingAddressList = RxList();
  RxList<AddressTextEditingController> shippingAddressList = RxList();
  RxBool shippingAllFieldsFilled = RxBool(true);
  RxBool billingAllFieldsFilled = RxBool(true);
  Map<String, String> billingFormData = {};
  Map<String, String> shippingFormData = {};
  int emailIndex = 0;
  int phoneNumberIndex = 0;

  @override
  void onInit() {
    shippingAddressFiled();
    billingAddressFiled();
    super.onInit();
  }

  void shippingAddressFiled() {
    AddressTextEditingController firstNameController =
        AddressTextEditingController(
      name: 'first_name'.tr,
      hint: 'enter_first_name'.tr,
      controller: TextEditingController(),
    );

    AddressTextEditingController lastNameController =
        AddressTextEditingController(
      name: 'last_name'.tr,
      hint: 'enter_last_name'.tr,
      controller: TextEditingController(),
    );

    AddressTextEditingController companyNameController =
        AddressTextEditingController(
      name: 'company_name'.tr,
      hint: 'enter_company_name'.tr,
      controller: TextEditingController(),
      optional: true,
    );

    AddressTextEditingController streetAddressController =
        AddressTextEditingController(
      name: 'street_address'.tr,
      hint: 'enter_street_address'.tr,
      controller: TextEditingController(),
    );

    AddressTextEditingController townCityController =
        AddressTextEditingController(
      name: 'town_city'.tr,
      hint: 'enter_town_city'.tr,
      controller: TextEditingController(),
    );

    AddressTextEditingController stateController = AddressTextEditingController(
      name: 'state'.tr,
      hint: 'enter_state'.tr,
      controller: TextEditingController(),
    );

    AddressTextEditingController pinCodeController =
        AddressTextEditingController(
      name: 'pin_code'.tr,
      hint: 'enter_pin_code'.tr,
      controller: TextEditingController(),
      keyboardType: TextInputType.number,
    );

    shippingAddressList.addAll([
      firstNameController,
      lastNameController,
      companyNameController,
      streetAddressController,
      townCityController,
      stateController,
      pinCodeController,
    ]);
  }

  void billingAddressFiled() {
    AddressTextEditingController firstNameController =
        AddressTextEditingController(
      name: 'first_name'.tr,
      hint: 'enter_first_name'.tr,
      controller: TextEditingController(),
    );

    AddressTextEditingController lastNameController =
        AddressTextEditingController(
      name: 'last_name'.tr,
      hint: 'enter_last_name'.tr,
      controller: TextEditingController(),
    );

    AddressTextEditingController companyNameController =
        AddressTextEditingController(
      name: 'company_name'.tr,
      hint: 'enter_company_name'.tr,
      controller: TextEditingController(),
      optional: true,
    );

    AddressTextEditingController streetAddressController =
        AddressTextEditingController(
      name: 'street_address'.tr,
      hint: 'enter_street_address'.tr,
      controller: TextEditingController(),
    );

    AddressTextEditingController townCityController =
        AddressTextEditingController(
      name: 'town_city'.tr,
      hint: 'enter_town_city'.tr,
      controller: TextEditingController(),
    );

    AddressTextEditingController stateController = AddressTextEditingController(
      name: 'state'.tr,
      hint: 'enter_state'.tr,
      controller: TextEditingController(),
    );

    AddressTextEditingController pinCodeController =
        AddressTextEditingController(
      name: 'pin_code'.tr,
      hint: 'enter_pin_code'.tr,
      controller: TextEditingController(),
      keyboardType: TextInputType.number,
    );

    AddressTextEditingController phoneController = AddressTextEditingController(
      name: 'phone'.tr,
      hint: 'enter_phone'.tr,
      controller: TextEditingController(),
      keyboardType: TextInputType.number,
    );

    AddressTextEditingController emailAddressController =
        AddressTextEditingController(
      name: 'email_address'.tr,
      hint: 'enter_email_address'.tr,
      controller: TextEditingController(),
    );

    billingAddressList.addAll([
      firstNameController,
      lastNameController,
      companyNameController,
      streetAddressController,
      townCityController,
      stateController,
      pinCodeController,
      phoneController,
      emailAddressController,
    ]);
    // chnage the email and phone number index based on your list
    emailIndex = billingAddressList.length - 1;
    phoneNumberIndex = billingAddressList.length - 2;
  }

  void onSubmitBillingButton({required BuildContext context}) {
    billingAllFieldsFilled.value = true;
    for (var addressController in billingAddressList) {
      final trimmedText = addressController.controller.text.trim();
      if (addressController.error!.value == true) {
        addressController.error!.value = false;
      }
      if (!addressController.optional && trimmedText.isEmpty) {
        addressController.error!.value = true;
        billingAllFieldsFilled.value = false;
      }
    }

    if (billingAllFieldsFilled.value) {
      if (!isItValidEmail(
          email: billingAddressList[emailIndex].controller.value.text)) {
        showSnackBar("please_enter_a_valid_email".tr);
      } else if (!isItValidPhone(
          phone: billingAddressList[phoneNumberIndex].controller.value.text)) {
        showSnackBar("please_enter_a_valid_number".tr);
      } else {
        for (var addressController in billingAddressList) {
          final trimmedText = addressController.controller.text.trim();
          billingFormData[addressController.name] = trimmedText;
        }
        showSnackBar("Done".tr);
        Navigator.pop(context);
      }
    } else {
      showSnackBar("please_fill_all_required_fields".tr);
    }
    billingAddressList.refresh();
  }

  void onSubmitShippingButton({required BuildContext context}) {
    shippingAllFieldsFilled.value = true;
    for (var addressController in shippingAddressList) {
      final trimmedText = addressController.controller.text.trim();
      if (addressController.error!.value == true) {
        addressController.error!.value = false;
      }
      if (!addressController.optional && trimmedText.isEmpty) {
        addressController.error!.value = true;
        shippingAllFieldsFilled.value = false;
      }
    }

    if (shippingAllFieldsFilled.value) {
      for (var addressController in shippingAddressList) {
        final trimmedText = addressController.controller.text.trim();
        shippingFormData[addressController.name] = trimmedText;
      }
      showSnackBar("Done".tr);
      Navigator.pop(context);
    } else {
      showSnackBar("please_fill_all_required_fields".tr);
    }
    shippingAddressList.refresh();
  }

  bool isItValidEmail({required String email}) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    return emailValid;
  }

  bool isItValidPhone({required String phone}) {
    final RegExp phoneRegex = RegExp(r'^\d{10}$');
    return phoneRegex.hasMatch(phone);
  }
}
