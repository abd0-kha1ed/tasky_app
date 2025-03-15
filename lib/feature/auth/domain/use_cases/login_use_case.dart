import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/excptions.dart';
import 'package:to_do_app/core/use_case/use_case.dart';
import 'package:to_do_app/feature/auth/domain/entites/login_entites.dart';
import 'package:to_do_app/feature/auth/domain/repos/auth_repo.dart';

class LoginUseCase extends UseCase<LoginEntites, LoginParams> {
  final AuthRepo authRepo;
  LoginUseCase(this.authRepo);

  @override
  Future<Either<ServerException, LoginEntites>> call(LoginParams param) async {
    return await authRepo.login(
        phoneNumber: param.phoneNumber, password: param.password);
  }
}

class LoginParams {
  final num phoneNumber;
  final String password;

  LoginParams({required this.phoneNumber, required this.password});
}
