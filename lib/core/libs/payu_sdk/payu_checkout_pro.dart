import 'package:get/get.dart';
import 'package:moomalpublication/config/payu_payment_config.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/libs/payu_sdk/hash_sevices.dart';
import 'package:moomalpublication/core/libs/payu_sdk/models/payment.dart';
import 'package:moomalpublication/core/utils/dialogs.dart';
import 'package:moomalpublication/features/orders/data/services/get_orders_services.dart';
import 'package:moomalpublication/services/logger/custom_logger.dart';
import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';

import '../../../routes/name_routes.dart';
import '../../../routes/routing.dart';

class PayUCheckoutPro implements PayUCheckoutProProtocol {
  late PayUCheckoutProFlutter _checkoutProFlutter;
  late Function _callBack;
  late String orderId;

  void init({Function? callBack}) {
    _checkoutProFlutter = PayUCheckoutProFlutter(this);
    _callBack = callBack!;
  }

  Future<void> pay(Payment payment) async {
    orderId = payment.orderId;

    final payUPaymentParams = _getPayUPaymentParams(payment);
    final payUCheckoutProConfig = _getPayUCheckoutProConfig();

    _checkoutProFlutter.openCheckoutScreen(
      payUPaymentParams: payUPaymentParams,
      payUCheckoutProConfig: payUCheckoutProConfig,
    );
  }

  Map<String, dynamic> _getPayUPaymentParams(Payment payment) {
    return {
      PayUPaymentParamKey.key: PayuPaymentConfig.key,
      PayUPaymentParamKey.productInfo: PayuPaymentConfig.merchantName,
      PayUPaymentParamKey.amount: payment.amount,
      PayUPaymentParamKey.firstName: payment.firstName,
      PayUPaymentParamKey.email: payment.email,
      PayUPaymentParamKey.phone: payment.phNumber,
      PayUPaymentParamKey.transactionId: payment.orderKey,
      PayUPaymentParamKey.environment: PayuPaymentConfig.env,
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
    CustomLogger.logger.d(response.toString());
  }

  @override
  onError(Map? response) async {
    showLottieDialog(
        Get.context!, AppAssets.failedAnimation, "payment_error".tr);
    CustomLogger.logger.e(response.toString());

    await GetOrderService.updateOrderStatus(orderId, {"status": "failed"});
  }

  @override
  onPaymentCancel(Map? response) async {
    showLottieDialog(
        Get.context!, AppAssets.failedAnimation, "payment_cancel".tr);
    CustomLogger.logger.w(response.toString());

    await GetOrderService.updateOrderStatus(orderId, {"status": "cancelled"});
  }

  @override
  onPaymentFailure(response) async {
    showLottieDialog(
        Get.context!, AppAssets.failedAnimation, "payment_failed".tr);
    CustomLogger.logger.e(response.toString());

    await GetOrderService.updateOrderStatus(orderId, {"status": "failed"});
  }

  @override
  onPaymentSuccess(response) async {
    AppRouting.offNamed(NameRoutes.thankYouPage, argument: orderId);
    _callBack();
    await GetOrderService.updateOrderStatus(orderId, {"status": "processing"});
  }
}
