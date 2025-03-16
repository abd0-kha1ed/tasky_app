import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/functions/setup_service_locator.dart';
import 'package:to_do_app/feature/auth/data/repos/auth_rope_impl.dart';
import 'package:to_do_app/feature/auth/domain/use_cases/register_use_case.dart';
import 'package:to_do_app/feature/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:to_do_app/feature/auth/presentation/view/widget/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        registerUseCase: RegisterUseCase(
          getIt<AuthRopeImpl>(),
        ),
      ),
      child: const Scaffold(
        body: SignUpViewBody(),
      ),
    );
  }
}
