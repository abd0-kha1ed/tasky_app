import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/excptions.dart';
import 'package:to_do_app/feature/auth/domain/entites/login_entites.dart';
import 'package:to_do_app/feature/auth/domain/entites/register_entites.dart';

abstract class AuthRepo {
  Future<Either<ServerException, LoginEntites>> login({
    required String phoneNumber,
    required String password,
  });

  Future<Either<ServerException, RegisterEntities>> register({
    required String name,
    required String phoneNumber,
    required String experienceYear,
    required String experienceLevel,
    required String address,
    required String password,
  });
}
