import 'package:to_do_app/feature/auth/domain/entites/register_entites.dart';

class RegisterModel extends RegisterEntites {
  final String id;
  final String accessToken;
  final String refreshToken;

  RegisterModel({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
    required super.name,
    required super.phoneNumber,
    required super.experienceYear,
    required super.experienceLevel,
    required super.address,
    required super.password,
  });

  /// تحويل JSON إلى كائن `RegisterModel`
  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) {
    return RegisterModel(
      id: jsonData['_id'],
      name: jsonData['displayName'],
      accessToken: jsonData['access_token'],
      refreshToken: jsonData['refresh_token'],
      phoneNumber: jsonData['phone'] ?? 0, // يمكن أن يكون غير موجود
      experienceYear: jsonData['experienceYears'] ?? 0,
      experienceLevel: jsonData['level'] ?? '',
      address: jsonData['address'] ?? '',
      password: jsonData['password'] ?? '',
    );
  }

  /// تحويل الكائن إلى JSON لإرساله في الطلب
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'displayName': name,
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'phone': phoneNumber,
      'experienceYears': experienceYear,
      'level': experienceLevel,
      'address': address,
      'password': password,
    };
  }
}
