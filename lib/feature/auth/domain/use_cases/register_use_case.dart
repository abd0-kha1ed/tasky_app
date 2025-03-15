import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/excptions.dart';
import 'package:to_do_app/core/use_case/use_case.dart';
import 'package:to_do_app/feature/auth/domain/entites/register_entites.dart';
import 'package:to_do_app/feature/auth/domain/repos/auth_repo.dart';

class RegisterUseCase extends UseCase<RegisterEntites, RegisterParam> {
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  @override
  Future<Either<ServerException, RegisterEntites>> call(
      RegisterParam param) async {
    return await authRepo.register(
        name: param.name,
        phoneNumber: param.phoneNumber,
        experienceYear: param.experienceYear,
        experienceLevel: param.experienceLevel,
        address: param.address,
        password: param.password);
  }
}

class RegisterParam {
  final String name;
  final num phoneNumber;
  final num experienceYear;
  final String experienceLevel;
  final String address;
  final String password;

  RegisterParam(
      {required this.name,
      required this.phoneNumber,
      required this.experienceYear,
      required this.experienceLevel,
      required this.address,
      required this.password});
}
