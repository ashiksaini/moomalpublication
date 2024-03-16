class BillingAddress {
  String? name;
  String? address;
  String? state;
  String? mobile;
  String? email;

  BillingAddress({
    this.name,
    this.address,
    this.state,
    this.mobile,
    this.email,
  });

  factory BillingAddress.fromJson(Map<String, dynamic> json) {
    return BillingAddress(
      name: json['name'] as String?,
      address: json['address'] as String?,
      state: json['state'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'state': state,
        'mobile': mobile,
        'email': email,
      };
}
