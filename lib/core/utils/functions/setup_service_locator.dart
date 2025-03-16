import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/core/api/dio_consumer.dart';
import 'package:to_do_app/feature/auth/data/data%20source/auth_remote_data_source.dart';
import 'package:to_do_app/feature/auth/data/repos/auth_rope_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator(SharedPreferences sharedPreferences) {
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: Dio(),
    ),
  );

  getIt.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSource(api: getIt.get<DioConsumer>()),
  );

  getIt.registerSingleton<AuthRopeImpl>(
    AuthRopeImpl(authRemoteDataSource: getIt.get<AuthRemoteDataSource>()),
  );
}
