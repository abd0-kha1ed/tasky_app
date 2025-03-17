import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/core/api/end_points.dart';
import 'package:to_do_app/core/cache/cache_helper.dart';
import 'package:to_do_app/core/utils/app_routers.dart';
import 'package:to_do_app/core/utils/assets.dart';
import 'package:to_do_app/feature/auth/presentation/manger/logout_cubit/logout_cubit.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/custom_logout_dialog.dart';

class HomeTasksAppBar extends StatelessWidget {
  const HomeTasksAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: SafeArea(
        child: Row(
          children: [
            Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kPrimaryColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  Assets.logo,
                  // width: 50,
                  // height: 50,
                ),
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouters.kProfileView);
              },
              child: Image.asset(
                Assets.profileImage,
                width: 25,
                height: 25,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => CustomLogoutDialog(
                          onConfirm: () => context.read<LogoutCubit>().logout(
                              accessToken: CacheHelper.getDataString(
                                  key: ApiKey.accessToken)),
                        ));
              },
              child: Image.asset(
                Assets.logOut,
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
