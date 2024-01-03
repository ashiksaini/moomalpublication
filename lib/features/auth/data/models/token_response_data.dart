class TokenResponseData {
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;

  TokenResponseData({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  factory TokenResponseData.fromJson(Map<String, dynamic> json) {
    return TokenResponseData(
      token: json['token'] as String?,
      userEmail: json['user_email'] as String?,
      userNicename: json['user_nicename'] as String?,
      userDisplayName: json['user_display_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'user_email': userEmail,
        'user_nicename': userNicename,
        'user_display_name': userDisplayName,
      };
}
