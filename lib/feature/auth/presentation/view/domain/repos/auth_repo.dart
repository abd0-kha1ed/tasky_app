import 'package:to_do_app/feature/auth/presentation/view/domain/entites/login_entites.dart';
import 'package:to_do_app/feature/auth/presentation/view/domain/entites/register_entites.dart';

abstract class AuthRepo {
  Future<LoginEntites> login(
      {required num phoneNumber, required String password});

  Future<RegisterEntites> register({
    required String name,
    required num phoneNumber,
    required num experienceYear,
    required String expericneLevel,
    required String address,
    required String password,
  });
}
