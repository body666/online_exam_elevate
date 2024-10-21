class ForgetPasswordResponse {
  String? message;
  String? info;

  ForgetPasswordResponse({this.message, this.info});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      message: json['message'] as String?,
      info: json['info'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'info': info,
      };
}
