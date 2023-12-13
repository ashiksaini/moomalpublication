class Destination {
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;

  Destination({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        address1: json['address_1'] as String?,
        address2: json['address_2'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        postcode: json['postcode'] as String?,
        country: json['country'] as String?,
      );
}
