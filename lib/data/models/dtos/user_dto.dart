import '../../../domain/entities/user.dart';

class UserDto {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? token;
  bool? isVerified;

  UserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.token,
    this.isVerified,
  });

  User toUser() {
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      username: username,
      email: email,
      phone: phone,
      token: token,
      isVerified: isVerified,
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json['_id'] as String?,
        username: json['username'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        token: json['token'] as String?,
        isVerified: json['isVerified'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'token': token,
        'isVerified': isVerified,
      };
}
