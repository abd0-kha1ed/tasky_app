import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/excptions.dart';
import 'package:to_do_app/core/use_case/use_case.dart';
import 'package:to_do_app/feature/auth/domain/entites/login_entites.dart';
import 'package:to_do_app/feature/auth/domain/repos/auth_repo.dart';

class LoginUseCase extends UseCase<LoginEntities, LoginParams> {
  final AuthRepo authRepo;
  LoginUseCase(this.authRepo);

  @override
  Future<Either<ServerException, LoginEntities>> call(LoginParams param) async {
    return await authRepo.login(
        phoneNumber: param.phoneNumber, password: param.password);
  }
}

class LoginParams {
  final String phoneNumber;
  final String password;

  LoginParams({required this.phoneNumber, required this.password});
}
