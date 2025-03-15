import 'package:to_do_app/core/api/end_points.dart';

class LoginModel {
  final String id;
  final String accessToken;
  final String refreshToken;

  LoginModel({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      id: jsonData[ApiKey.id],
      accessToken: jsonData[ApiKey.accesstoken],
      refreshToken: jsonData[ApiKey.refreshToken],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
