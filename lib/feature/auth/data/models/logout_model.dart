import 'package:to_do_app/core/api/end_points.dart';

class LogoutModel {
  final String message;
  final int statusCode;

  LogoutModel({required this.message, required this.statusCode});

  factory LogoutModel.fromJson(Map<String, dynamic> jsonData) {
    return LogoutModel(
        message: jsonData[ApiKey.message], statusCode: jsonData[ApiKey.status]);
  }
}
