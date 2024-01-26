import 'package:get/get.dart';
import 'package:moomalpublication/config/payu_payment_config.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/libs/payu_sdk/hash_sevices.dart';
import 'package:moomalpublication/core/utils/dialogs.dart';
import 'package:moomalpublication/core/utils/utility.dart';
import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';

class PayUCheckoutPro implements PayUCheckoutProProtocol {
  late PayUCheckoutProFlutter _checkoutProFlutter;

  void init() {
    _checkoutProFlutter = PayUCheckoutProFlutter(this);
  }

  Future<void> pay(String? totalPrice, String? orderId) async {
    final payUPaymentParams = _getPayUPaymentParams(
        totalPrice ?? "1.0", orderId ?? Utility.generateTransactionId());
    final payUCheckoutProConfig = _getPayUCheckoutProConfig();

    _checkoutProFlutter.openCheckoutScreen(
      payUPaymentParams: payUPaymentParams,
      payUCheckoutProConfig: payUCheckoutProConfig,
    );
  }

  Map<String, dynamic> _getPayUPaymentParams(String amount, String orderId) {
    return {
      PayUPaymentParamKey.key: PayuPaymentConfig.key,
      PayUPaymentParamKey.amount: amount,
      PayUPaymentParamKey.productInfo: PayuPaymentConfig.merchantName,
      PayUPaymentParamKey.firstName: PayuPaymentConfig.merchantName,
      PayUPaymentParamKey.email: PayuPaymentConfig.email,
      PayUPaymentParamKey.phone: PayuPaymentConfig.phNumber,
      PayUPaymentParamKey.environment: PayuPaymentConfig.env,
      PayUPaymentParamKey.transactionId:
          orderId, // transactionId Cannot be null or empty and should be unique for each transaction. Maximum allowed length is 25 characters. It cannot contain special characters like: -_/
      PayUPaymentParamKey.userCredential: PayuPaymentConfig.userCredential,
      PayUPaymentParamKey.android_surl:
          "https://www.payumoney.com/mobileapp/payumoney/success.php",
      PayUPaymentParamKey.android_furl:
          "https://www.payumoney.com/mobileapp/payumoney/failure.php",
      PayUPaymentParamKey.ios_surl:
          "https://www.payumoney.com/mobileapp/payumoney/success.php",
      PayUPaymentParamKey.ios_furl:
          "https://www.payumoney.com/mobileapp/payumoney/failure.php",
    };
  }

  Map<String, dynamic> _getPayUCheckoutProConfig() {
    return {
      PayUCheckoutProConfigKeys.merchantName: PayuPaymentConfig.merchantName,
    };
  }

  @override
  generateHash(Map response) {
    _checkoutProFlutter.hashGenerated(hash: HashService.generateHash(response));
    throw UnimplementedError();
  }

  @override
  onError(Map? response) {
    showLottieDialog(
        Get.context!, AppAssets.failedAnimation, "payment_error".tr);
    throw UnimplementedError();
  }

  @override
  onPaymentCancel(Map? response) {
    showLottieDialog(
        Get.context!, AppAssets.failedAnimation, "payment_cancel".tr);
    throw UnimplementedError();
  }

  @override
  onPaymentFailure(response) {
    showLottieDialog(
        Get.context!, AppAssets.failedAnimation, "payment_failed".tr);
    throw UnimplementedError();
  }

  @override
  onPaymentSuccess(response) {
    showLottieDialog(
        Get.context!, AppAssets.successAnimation, "payment_success".tr);
    throw UnimplementedError();
  }
}
