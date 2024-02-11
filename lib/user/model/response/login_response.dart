class LoginResponse {
  final int id;
  final String message;
  final String email;
  final bool profileStatus;
  final String accessToken;
  final String refreshToken;
  final String accountType;
  final String enableLoginStatus;

  LoginResponse({
    required this.id,
    required this.message,
    required this.email,
    required this.profileStatus,
    required this.accessToken,
    required this.refreshToken,
    required this.accountType,
    required this.enableLoginStatus,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'] as int,
      message: json['message'] as String,
      email: json['email'] as String,
      profileStatus: json['profileStatus'] as bool,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      accountType: json['accountType'] as String,
      enableLoginStatus: json['enableLoginStatus'] as String,
    );
  }
}
