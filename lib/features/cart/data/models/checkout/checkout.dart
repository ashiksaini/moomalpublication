import 'package:moomalpublication/core/base/billing_address.dart';
import 'package:moomalpublication/core/base/shipping_address.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/extensions.dart';
import 'payment_result.dart';

class Checkout {
  int? orderId;
  String? status;
  String? orderKey;
  String? customerNote;
  int? customerId;
  BillingAddress? billingAddress;
  ShippingAddress? shippingAddress;
  String? paymentMethod;
  PaymentResult? paymentResult;
  Extensions? extensions;

  Checkout({
    this.orderId,
    this.status,
    this.orderKey,
    this.customerNote,
    this.customerId,
    this.billingAddress,
    this.shippingAddress,
    this.paymentMethod,
    this.paymentResult,
    this.extensions,
  });

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        orderId: json['order_id'] as int?,
        status: json['status'] as String?,
        orderKey: json['order_key'] as String?,
        customerNote: json['customer_note'] as String?,
        customerId: json['customer_id'] as int?,
        billingAddress: json['billing_address'] == null
            ? null
            : BillingAddress.fromJson(
                json['billing_address'] as Map<String, dynamic>),
        shippingAddress: json['shipping_address'] == null
            ? null
            : ShippingAddress.fromJson(
                json['shipping_address'] as Map<String, dynamic>),
        paymentMethod: json['payment_method'] as String?,
        paymentResult: json['payment_result'] == null
            ? null
            : PaymentResult.fromJson(
                json['payment_result'] as Map<String, dynamic>),
        extensions: json['extensions'] == null
            ? null
            : Extensions.fromJson(json['extensions'] as Map<String, dynamic>),
      );
}
