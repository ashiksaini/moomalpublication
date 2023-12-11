class UserData {
  int? id;
  String? userEmail;

  UserData({this.id, this.userEmail});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['user_id'] as int?,
      userEmail: json['user_email'] as String?,
    );
  }
}
