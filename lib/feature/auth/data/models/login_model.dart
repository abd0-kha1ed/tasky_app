import 'package:to_do_app/core/api/end_points.dart';
import 'package:to_do_app/feature/auth/domain/entites/login_entites.dart';

class LoginModel extends LoginEntities {
  final String accessToken;
  final String refreshToken;

  LoginModel({
    required super.id,
    required super.phoneNumber,
    required super.password,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      id: jsonData[ApiKey.id] ?? '',
      phoneNumber: jsonData[ApiKey.phoneNumber] ?? '',
      password: jsonData[ApiKey.password] ?? '',
      accessToken: jsonData[ApiKey.accessToken] ?? '',
      refreshToken: jsonData[ApiKey.refreshToken] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.phoneNumber: phoneNumber,
      ApiKey.password: password,
      ApiKey.accessToken: accessToken,
      ApiKey.refreshToken: refreshToken,
    };
  }
}
