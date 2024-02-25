import 'package:moomalpublication/core/base/billing_address.dart';
import 'package:moomalpublication/core/base/shipping_address.dart';

class AddressData {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  String? username;
  BillingAddress? billing;
  ShippingAddress? shipping;
  bool? isPayingCustomer;
  String? avatarUrl;

  AddressData({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.email,
    this.firstName,
    this.lastName,
    this.role,
    this.username,
    this.billing,
    this.shipping,
    this.isPayingCustomer,
    this.avatarUrl,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
        id: json['id'] as int?,
        dateCreated: json['date_created'] as String?,
        dateCreatedGmt: json['date_created_gmt'] as String?,
        dateModified: json['date_modified'] as String?,
        dateModifiedGmt: json['date_modified_gmt'] as String?,
        email: json['email'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        role: json['role'] as String?,
        username: json['username'] as String?,
        billing: json['billing'] == null
            ? null
            : BillingAddress.fromJson(json['billing'] as Map<String, dynamic>),
        shipping: json['shipping'] == null
            ? null
            : ShippingAddress.fromJson(
                json['shipping'] as Map<String, dynamic>),
        isPayingCustomer: json['is_paying_customer'] as bool?,
        avatarUrl: json['avatar_url'] as String?,
      );
}
