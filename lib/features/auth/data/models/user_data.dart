class UserData {
  int? id;

  UserData({this.id});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['user_id'] as int?,
    );
  }
}
