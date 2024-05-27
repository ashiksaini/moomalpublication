import 'package:moomalpublication/features/contact_us/data/constants/emuns.dart';

class Address {
  String? iconName;
  String? addressHeader;
  String? addressDescription;
  ContactType? contactType;

  Address(
      {this.addressHeader,
      this.addressDescription,
      this.iconName,
      this.contactType});
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        iconName: json['iconName'] as String?,
        addressHeader: json['addressHeader'] as String?,
        addressDescription: json['addressDescription'] as String?,
      );
}
