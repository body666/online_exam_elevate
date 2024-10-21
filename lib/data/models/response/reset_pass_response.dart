class ResetPassResponse {
  String? message;
  String? token;

  ResetPassResponse({this.message, this.token});

  factory ResetPassResponse.fromJson(Map<String, dynamic> json) {
    return ResetPassResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
      };
}
