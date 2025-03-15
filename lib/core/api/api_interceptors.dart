import 'package:dio/dio.dart';
import 'package:to_do_app/core/api/end_points.dart';
import 'package:to_do_app/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.accessToken] =
        CacheHelper().getData(key: ApiKey.accessToken) != null
            ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.accessToken)}'
            : null;
    super.onRequest(options, handler);
  }
}
