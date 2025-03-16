import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/cache/cache_helper.dart';
import 'package:to_do_app/core/utils/app_routers.dart';
import 'package:to_do_app/core/utils/functions/setup_service_locator.dart';

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
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.router,
    );
  }
}
