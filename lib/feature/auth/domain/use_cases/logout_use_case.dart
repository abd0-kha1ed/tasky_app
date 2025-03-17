import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/excptions.dart';
import 'package:to_do_app/core/use_case/use_case.dart';
import 'package:to_do_app/feature/auth/data/models/logout_model.dart';
import 'package:to_do_app/feature/auth/domain/repos/auth_repo.dart';

class LogoutUseCase extends UseCase<LogoutModel, LogoutParam>{
  final AuthRepo authRepo;
  LogoutUseCase(this.authRepo);
  
  @override
  Future<Either<ServerException, LogoutModel>> call(LogoutParam param) async{
    return await authRepo.logout(accessToken: param.accessToken);
  }
  
  
  
}
class LogoutParam{
  final String accessToken;

  LogoutParam({required this.accessToken});
}