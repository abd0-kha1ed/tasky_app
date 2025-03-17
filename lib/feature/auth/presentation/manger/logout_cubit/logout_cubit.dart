import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/feature/auth/domain/use_cases/logout_use_case.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.logoutUseCase) : super(LogoutInitial());
  final LogoutUseCase logoutUseCase;

  Future<void> logout({required String accessToken}) async {
    emit(LogoutLoading());
    final response = await logoutUseCase.call(LogoutParam(accessToken: accessToken));
    response.fold((f)=>emit(LogoutFailure(f.errModel.errorMessage)), (r)=>emit(LogoutSuccess()));
  }
}
