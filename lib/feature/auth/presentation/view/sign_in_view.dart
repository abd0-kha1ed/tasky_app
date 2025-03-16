import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/functions/setup_service_locator.dart';
import 'package:to_do_app/feature/auth/data/repos/auth_rope_impl.dart';
import 'package:to_do_app/feature/auth/domain/use_cases/login_use_case.dart';
import 'package:to_do_app/feature/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:to_do_app/feature/auth/presentation/view/widget/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(LoginUseCase(getIt<AuthRopeImpl>())),
        child: const SignInViewBody(),
      ),
    );
  }
}
