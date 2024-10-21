class AuthResponse {
  String? message;
  String? token;

  AuthResponse({this.message, this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        message: json['message'] as String?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
      };
}
