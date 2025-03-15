import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_routers.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) {
      return const TaskyApp();
    }
  ));
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
      //  builder: (context, child) => ResponsiveWrapper.builder(child,
      //     maxWidth: 1200,
      //     minWidth: 480,
      //     defaultScale: true,
      //     breakpoints: [
      //       const ResponsiveBreakpoint.resize(480, name: MOBILE),
      //       const ResponsiveBreakpoint.autoScale(800, name: TABLET),
      //       const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      //     ],
      //     background: Container(color: const Color(0xFFF5F5F5))),
    );
  }
}
