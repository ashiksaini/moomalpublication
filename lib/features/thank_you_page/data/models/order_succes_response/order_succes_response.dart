import 'billing_address.dart';
import 'order_detail.dart';

class OrderSuccessResponse {
  String? orderNumber;
  String? email;
  DateTime? date;
  String? total;
  String? paymentMethod;
  List<OrderDetail>? orderDetails;
  BillingAddress? billingAddress;

  OrderSuccessResponse({
    this.orderNumber,
    this.email,
    this.date,
    this.total,
    this.paymentMethod,
    this.orderDetails,
    this.billingAddress,
  });

  factory OrderSuccessResponse.fromJson(Map<String, dynamic> json) {
    return OrderSuccessResponse(
      orderNumber: json['order_number'] as String?,
      email: json['email'] as String?,
      date: json["date"] == null ? null : DateTime.parse(json["date"]),
      total: json['total'] as String?,
      paymentMethod: json['payment_method'] as String?,
      orderDetails: (json['order_details'] as List<dynamic>?)
          ?.map((e) => OrderDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      billingAddress: json['billing_address'] == null
          ? null
          : BillingAddress.fromJson(
              json['billing_address'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'order_number': orderNumber,
        'email': email,
        'date': date,
        'total': total,
        'payment_method': paymentMethod,
        'order_details': orderDetails?.map((e) => e.toJson()).toList(),
        'billing_address': billingAddress?.toJson(),
      };
}
