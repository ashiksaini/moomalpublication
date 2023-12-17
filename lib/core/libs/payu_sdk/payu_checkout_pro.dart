import 'package:moomalpublication/core/libs/payu_sdk/hash_sevices.dart';
import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';

class PayUCheckoutPro implements PayUCheckoutProProtocol {
  late PayUCheckoutProFlutter _checkoutProFlutter;

  void init() {
    _checkoutProFlutter = PayUCheckoutProFlutter(this);
  }

  Future<void> pay() async {
    final payUPaymentParams = _getPayUPaymentParams();
    print(payUPaymentParams);

    final payUCheckoutProConfig = _getPayUCheckoutProConfig();
    print(payUCheckoutProConfig);

    _checkoutProFlutter.openCheckoutScreen(
      payUPaymentParams: payUPaymentParams,
      payUCheckoutProConfig: payUCheckoutProConfig,
    );
  }

  Map<String, dynamic> _getPayUPaymentParams() {
    return {
      PayUPaymentParamKey.key: "Ome12@3yu",
      PayUPaymentParamKey.amount: "1.0",
      PayUPaymentParamKey.productInfo: "Payu",
      PayUPaymentParamKey.firstName: "ASHIK SAINI",
      PayUPaymentParamKey.email: "saini4400@gmail.com",
      PayUPaymentParamKey.phone: "9982258132",
      PayUPaymentParamKey.environment: "1", // String - "0" for Production and "1" for Test
      PayUPaymentParamKey.transactionId: "abc123456sss7982", // transactionId Cannot be null or empty and should be unique for each transaction. Maximum allowed length is 25 characters. It cannot contain special characters like: -_/
      PayUPaymentParamKey.userCredential: "9982696197", //  Format: <merchantKey>:<userId> ... UserId is any id/email/phone number to uniquely identify the user.
      PayUPaymentParamKey.android_surl: "https://www.payumoney.com/mobileapp/payumoney/success.php",
      PayUPaymentParamKey.android_furl: "https://www.payumoney.com/mobileapp/payumoney/failure.php",
      PayUPaymentParamKey.ios_surl: "https://www.payumoney.com/mobileapp/payumoney/success.php",
      PayUPaymentParamKey.ios_furl: "https://www.payumoney.com/mobileapp/payumoney/failure.php",
    };
  }

  Map<String, dynamic> _getPayUCheckoutProConfig() {
    return {
      PayUCheckoutProConfigKeys.merchantName: "PayU",
    };
  }

  @override
  generateHash(Map response) {
    print("generateHash: $response");
    Map hashResponse = HashService.generateHash(response);
    print("generateHash: $hashResponse");
    _checkoutProFlutter.hashGenerated(hash: hashResponse);
    throw UnimplementedError();
  }

  @override
  onError(Map? response) {
    print("onError: $response");
    throw UnimplementedError();
  }

  @override
  onPaymentCancel(Map? response) {
    print("onPaymentCancel: $response");
    throw UnimplementedError();
  }

  @override
  onPaymentFailure(response) {
    print("onPaymentFailure: $response");
    throw UnimplementedError();
  }

  @override
  onPaymentSuccess(response) {
    print("onPaymentSuccess: $response");
    throw UnimplementedError();
  }
}