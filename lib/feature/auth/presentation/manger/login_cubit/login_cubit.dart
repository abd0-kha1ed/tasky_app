import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/feature/auth/domain/entites/login_entites.dart';
import 'package:to_do_app/feature/auth/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  Future<void> login(String phoneNumber, String password) async {
    emit(LoginLoading());
    final response = await loginUseCase
        .call(LoginParams(phoneNumber: phoneNumber, password: password));
    response.fold(
        (failure) => emit(LoginFailure(failure.errModel.errorMessage)),
        (loginSuccess) => emit(LoginSuccess(loginSuccess)));
  }
}
