import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends QueuedInterceptor {
  SharedPreferences? sharedPreferences;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);

    sharedPreferences = await SharedPreferences.getInstance();

    final token = sharedPreferences!.getString("accessToken");

    if (token != "" && token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
  }
}
