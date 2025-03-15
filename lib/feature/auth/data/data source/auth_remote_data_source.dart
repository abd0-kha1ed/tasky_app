import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/api/api_consumer.dart';
import 'package:to_do_app/core/api/end_points.dart';
import 'package:to_do_app/core/errors/error_model.dart';
import 'package:to_do_app/core/errors/excptions.dart';
import 'package:to_do_app/feature/auth/data/models/login_model.dart';
import 'package:to_do_app/feature/auth/data/models/register_model.dart';

class AuthRemoteDataSource {
  final ApiConsumer api;

  AuthRemoteDataSource({required this.api});

  Future<Either<ServerException, LoginModel>> login({
    required num phone,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.phoneNumber: phone,
          ApiKey.password: password,
        },
      );

      return Right(LoginModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerException(errModel: e.errModel));
    }
  }

  Future<Either<ServerException, RegisterModel>> register({
    required String name,
    required num phoneNumber,
    required num experienceYear,
    required String experienceLevel,
    required String address,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        data: {
          ApiKey.name: name,
          ApiKey.phoneNumber: phoneNumber,
          ApiKey.experinceYear: experienceYear,
          ApiKey.expericneLevel: experienceLevel,
          ApiKey.address: address,
          ApiKey.password: password,
        },
      );

      return Right(RegisterModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerException(errModel: e.errModel));
    }
  }
}
