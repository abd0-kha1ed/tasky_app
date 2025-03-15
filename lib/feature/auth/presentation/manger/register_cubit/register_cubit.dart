import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/feature/auth/domain/use_cases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;

  Future<void> register({
    required String name,
    required String phoneNumber,
    required String experienceYear,
    required String experienceLevel,
    required String address,
    required String password,
  }) async {
    emit(RegisterLoading());
    final response = await registerUseCase.call(RegisterParam(
        name: name,
        phoneNumber: phoneNumber,
        experienceYear: experienceYear,
        experienceLevel: experienceLevel,
        address: address,
        password: password));
    response.fold(
      (failure) => emit(
        RegisterFailure(failure.errModel.errorMessage),
      ),
      (registerSuccess) => emit(
        RegisterSuccess(),
      ),
    );
  }
}
