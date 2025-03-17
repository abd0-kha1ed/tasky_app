import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/cache/cache_helper.dart';
import 'package:to_do_app/core/utils/app_routers.dart';
import 'package:to_do_app/core/utils/functions/setup_service_locator.dart';
import 'package:to_do_app/feature/auth/data/repos/auth_rope_impl.dart';
import 'package:to_do_app/feature/auth/domain/use_cases/logout_use_case.dart';
import 'package:to_do_app/feature/auth/presentation/manger/logout_cubit/logout_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  setupServiceLocator(CacheHelper.sharedPreferences);

  runApp(
    DevicePreview(
      builder: (context) => const TaskyApp(),
    ),
  );
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(LogoutUseCase(getIt<AuthRopeImpl>())),
      child: MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouters.router,
      ),
    );
  }
}
