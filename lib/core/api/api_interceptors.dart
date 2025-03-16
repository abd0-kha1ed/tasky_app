import 'package:dio/dio.dart';
import 'package:to_do_app/core/api/end_points.dart';
import 'package:to_do_app/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? userId = CacheHelper.getDataString(key: ApiKey.id);

    if (userId.isNotEmpty) {
      // ✅ تجنب إضافة null
      options.headers[ApiKey.id] = userId;
    }

    super.onRequest(options, handler);
  }
}
