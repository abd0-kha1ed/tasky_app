import 'package:dio/dio.dart';
import 'package:to_do_app/core/api/end_points.dart';
import 'package:to_do_app/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.id] =
        CacheHelper().getData(key: ApiKey.id) != null
            ? '${CacheHelper().getData(key: ApiKey.id)}'
            : null;
    super.onRequest(options, handler);
  }

 
}
