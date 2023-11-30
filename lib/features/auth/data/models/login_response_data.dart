class LoginResponseData {
  int? id;
  String? username;
  String? email;
  String? role;
  String? avatarUrl;

  LoginResponseData({
    this.id,
    this.username,
    this.email,
    this.role,
    this.avatarUrl,
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) {
    return LoginResponseData(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );
  }
}
