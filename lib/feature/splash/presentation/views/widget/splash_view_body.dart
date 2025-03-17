import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/api/end_points.dart';
import 'package:to_do_app/core/cache/cache_helper.dart';
import 'package:to_do_app/core/utils/app_routers.dart';
import 'package:to_do_app/core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  void navigateToNextView() {
    Future.delayed(const Duration(seconds: 4), () {
      final String accessToken =
          CacheHelper.getDataString(key: ApiKey.accessToken);

      if (accessToken.isNotEmpty) {
        GoRouter.of(context).go(AppRouters
            .kHomeTasks); // ✅ التوجيه للـ HomeView إذا كان المستخدم مسجلاً
      } else {
        GoRouter.of(context).go(AppRouters
            .kStartView); // ✅ التوجيه لـ StartView إذا لم يسجل المستخدم
      }
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToNextView();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            Assets.logo,
            height: 45,
          ),
        ),
      ],
    );
  }
}
