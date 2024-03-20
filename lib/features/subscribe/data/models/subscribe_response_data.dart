class SubscribeResponseData {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  dynamic gender;
  String? country;
  String? region;
  String? city;
  List<dynamic>? lists;
  List<dynamic>? extraFields;
  String? status;

  SubscribeResponseData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.country,
    this.region,
    this.city,
    this.lists,
    this.extraFields,
    this.status,
  });

  factory SubscribeResponseData.fromJson(Map<String, dynamic> json) {
    return SubscribeResponseData(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      gender: json['gender'] as dynamic,
      country: json['country'] as String?,
      region: json['region'] as String?,
      city: json['city'] as String?,
      lists: json['lists'] as List<dynamic>?,
      extraFields: json['extra_fields'] as List<dynamic>?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'gender': gender,
        'country': country,
        'region': region,
        'city': city,
        'lists': lists,
        'extra_fields': extraFields,
        'status': status,
      };
}
