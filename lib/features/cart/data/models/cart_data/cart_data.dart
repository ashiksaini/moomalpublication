import 'package:moomalpublication/core/base/billing_address.dart';
import 'package:moomalpublication/core/base/shipping_address.dart';

import 'extensions.dart';
import 'item.dart';
import 'shipping_rate.dart';
import 'totals.dart';

class CartData {
  List<dynamic>? coupons;
  List<ShippingRate>? shippingRates;
  ShippingAddress? shippingAddress;
  BillingAddress? billingAddress;
  List<Item>? items;
  int? itemsCount;
  int? itemsWeight;
  List<dynamic>? crossSells;
  bool? needsPayment;
  bool? needsShipping;
  bool? hasCalculatedShipping;
  List<dynamic>? fees;
  Totals? totals;
  List<dynamic>? errors;
  List<dynamic>? paymentMethods;
  List<dynamic>? paymentRequirements;
  Extensions? extensions;

  CartData({
    this.coupons,
    this.shippingRates,
    this.shippingAddress,
    this.billingAddress,
    this.items,
    this.itemsCount,
    this.itemsWeight,
    this.crossSells,
    this.needsPayment,
    this.needsShipping,
    this.hasCalculatedShipping,
    this.fees,
    this.totals,
    this.errors,
    this.paymentMethods,
    this.paymentRequirements,
    this.extensions,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        coupons: json['coupons'] as List<dynamic>?,
        shippingRates: (json['shipping_rates'] as List<dynamic>?)
            ?.map((e) => ShippingRate.fromJson(e as Map<String, dynamic>))
            .toList(),
        shippingAddress: json['shipping_address'] == null
            ? null
            : ShippingAddress.fromJson(
                json['shipping_address'] as Map<String, dynamic>),
        billingAddress: json['billing_address'] == null
            ? null
            : BillingAddress.fromJson(
                json['billing_address'] as Map<String, dynamic>),
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        itemsCount: json['items_count'] as int?,
        itemsWeight: json['items_weight'] as int?,
        crossSells: json['cross_sells'] as List<dynamic>?,
        needsPayment: json['needs_payment'] as bool?,
        needsShipping: json['needs_shipping'] as bool?,
        hasCalculatedShipping: json['has_calculated_shipping'] as bool?,
        fees: json['fees'] as List<dynamic>?,
        totals: json['totals'] == null
            ? null
            : Totals.fromJson(json['totals'] as Map<String, dynamic>),
        errors: json['errors'] as List<dynamic>?,
        paymentMethods: json['payment_methods'] as List<dynamic>?,
        paymentRequirements: json['payment_requirements'] as List<dynamic>?,
        // extensions: json['extensions'] == null
        //     ? null
        //     : Extensions.fromJson(json['extensions'] as Map<String, dynamic>),
      );
}
