class Address {
  String? iconName;
  String? addressHeader;
  String? addressDescription;

  Address({this.addressHeader, this.addressDescription, this.iconName});
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        iconName: json['iconName'] as String?,
        addressHeader: json['addressHeader'] as String?,
        addressDescription: json['addressDescription'] as String?,
      );
}
