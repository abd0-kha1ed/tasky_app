import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/excptions.dart';

import 'package:to_do_app/feature/auth/presentation/view/domain/entites/login_entites.dart';
import 'package:to_do_app/feature/auth/presentation/view/domain/entites/register_entites.dart';

abstract class AuthRepo {
  Future<Either<ServerException, LoginEntites>> login({
    required num phoneNumber,
    required String password,
  });

  Future<Either<ServerException, RegisterEntites>> register({
    required String name,
    required num phoneNumber,
    required num experienceYear,
    required String experienceLevel,
    required String address,
    required String password,
  });
}
