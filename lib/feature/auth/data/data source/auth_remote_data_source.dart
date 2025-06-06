import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:to_do_app/core/api/api_consumer.dart';
import 'package:to_do_app/core/api/end_points.dart';
import 'package:to_do_app/core/cache/cache_helper.dart';
import 'package:to_do_app/core/errors/excptions.dart';
import 'package:to_do_app/feature/auth/data/models/login_model.dart';
import 'package:to_do_app/feature/auth/data/models/logout_model.dart';
import 'package:to_do_app/feature/auth/data/models/register_model.dart';

class AuthRemoteDataSource {
  final ApiConsumer api;

  AuthRemoteDataSource({required this.api});

  Future<Either<ServerException, LoginModel>> login({
    required String phone,
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
      final user = LoginModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.refreshToken);
      CacheHelper.saveData(key: ApiKey.refreshToken, value: user.refreshToken);
      CacheHelper.saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerException(errModel: e.errModel));
    }
  }

  Future<Either<ServerException, RegisterModel>> register({
    required String name,
    required String phoneNumber,
    required int experienceYear,
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

  Future<Either<ServerException, LogoutModel>> logout(
      {required String refreshToken}) async {
    final token = CacheHelper.getDataString(key: ApiKey.refreshToken);
    try {
      final response = await api.post(EndPoint.logout, data: {
        ApiKey.token: token,
      });
      // await CacheHelper.removeData(key: ApiKey.accessToken);
      return Right(LogoutModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerException(errModel: e.errModel));
    }
  }
}
