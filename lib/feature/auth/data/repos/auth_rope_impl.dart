import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/excptions.dart';
import 'package:to_do_app/feature/auth/data/data%20source/auth_remote_data_source.dart';
import 'package:to_do_app/feature/auth/domain/entites/login_entites.dart';
import 'package:to_do_app/feature/auth/domain/entites/register_entites.dart';
import 'package:to_do_app/feature/auth/domain/repos/auth_repo.dart';

class AuthRopeImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRopeImpl({required this.authRemoteDataSource});

  @override
  Future<Either<ServerException, LoginEntities>> login(
      {required String phoneNumber, required String password}) async {
    return await authRemoteDataSource.login(
        phone: phoneNumber, password: password);
  }

  @override
  Future<Either<ServerException, RegisterEntities>> register(
      {required String name,
      required String phoneNumber,
      required int experienceYear,
      required String experienceLevel,
      required String address,
      required String password}) async {
    return await authRemoteDataSource.register(
        name: name,
        phoneNumber: phoneNumber,
        experienceYear: experienceYear,
        experienceLevel: experienceLevel,
        address: address,
        password: password);
  }
}
