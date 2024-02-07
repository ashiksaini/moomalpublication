import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/base/billing_address.dart';
import 'package:moomalpublication/core/base/shipping_address.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/address/data/constants/type_alias.dart';
import 'package:moomalpublication/features/address/data/models/address_model.dart';
import 'package:moomalpublication/features/address/data/services/address_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class AdressController extends BaseController {
  RxList<AddressTextEditingController> billingAddressList = RxList();
  RxList<AddressTextEditingController> shippingAddressList = RxList();
  Rx<AddressDataResponse> addressDataResponse = Rx(ApiResponse());
  Rx<BillingAddress?> billingAddress = Rx(null);
  Rx<ShippingAddress?> shippingAddress = Rx(null);
  RxBool shippingAllFieldsFilled = RxBool(true);
  RxBool billingAllFieldsFilled = RxBool(true);
  Map<String, String> billingFormData = {};
  Map<String, String> shippingFormData = {};
  int emailIndex = 0;
  int phoneNumberIndex = 0;

  @override
  void onInit() {
    super.onInit();
    shippingAddressFiled();
    billingAddressFiled();

    _getAddress();
  }

  Future<void> _getAddress() async {
    addressDataResponse.value = ApiResponse.loading();
    addressDataResponse.value = await AddressServices.getAddress();

    if (addressDataResponse.value.data != null) {
      billingAddress.value = addressDataResponse.value.data!.billing;
      shippingAddress.value = addressDataResponse.value.data!.shipping;
    }
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
        final data = getAddressData(
          firstName: billingAddressList[0].controller.text.trim(),
          lastName: billingAddressList[1].controller.text.trim(),
          company: billingAddressList[2].controller.text.trim(),
          address1: billingAddressList[3].controller.text.trim(),
          city: billingAddressList[4].controller.text.trim(),
          state: billingAddressList[5].controller.text.trim(),
          postalCode: billingAddressList[6].controller.text.trim(),
          phone: billingAddressList[7].controller.text.trim(),
          email: billingAddressList[8].controller.text.trim(),
        );

        _postAddressData(data);

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
      final data = getAddressData(
        firstName: shippingAddressList[0].controller.text.trim(),
        lastName: shippingAddressList[1].controller.text.trim(),
        company: shippingAddressList[2].controller.text.trim(),
        address1: shippingAddressList[3].controller.text.trim(),
        city: shippingAddressList[4].controller.text.trim(),
        state: shippingAddressList[5].controller.text.trim(),
        postalCode: shippingAddressList[6].controller.text.trim(),
        isBillingAddress: false,
      );

      _postAddressData(data);

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

  Future<void> _postAddressData(Map<String, dynamic> data) async {
    addressDataResponse.value = ApiResponse.loading();
    addressDataResponse.value = await AddressServices.upsertAddress(data);

    if (addressDataResponse.value.data != null) {
      billingAddress.value = addressDataResponse.value.data!.billing;
      shippingAddress.value = addressDataResponse.value.data!.shipping;
    }
  }

  Map<String, dynamic> getAddressData({
    String? firstName,
    String? lastName,
    String? company,
    String? address1,
    String? address2,
    String? city,
    String? postalCode,
    String? country,
    String? state,
    String? email,
    String? phone,
    bool isBillingAddress = true,
  }) {
    Map<String, dynamic> data = {
      "first_name": firstName,
      "last_name": lastName,
      "company": company,
      "address_1": address1,
      "city": city,
      "postcode": postalCode,
      "state": state,
      "country": "India",
    };

    data.addIf(isBillingAddress, "email", email);
    data.addIf(isBillingAddress, "phone", phone);

    Map<String, dynamic> finalData = {};

    if (isBillingAddress) {
      finalData["billing"] = data;
    } else {
      finalData["shipping"] = data;
    }

    return finalData;
  }
}
