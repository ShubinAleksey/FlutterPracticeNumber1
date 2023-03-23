import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interceptors/auth_interceptors.dart';
import '../models/user.dart';

class AuthDioUtils {
  late Dio dio;

  SharedPreferences? sharedPreferences;

  AuthDioUtils() {
    _share().then;
    _connectDio();
  }

  Future<void> _share() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> _connectDio() async {
    dio = Dio(
      BaseOptions(
          baseUrl: "http://127.0.0.1:9996",
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(milliseconds: 3500),
          receiveTimeout: const Duration(milliseconds: 3500),
          sendTimeout: const Duration(milliseconds: 3500)),
    );

    dio.options.headers["content-type"] = "application/json";
    dio.interceptors.add(AuthInterceptor());
  }

  Future<bool> Authenticate(String userName, String password) async {
    try {
      final response = await dio
          .post("/token", data: {'userName': userName, 'password': password});
      if (response.statusCode == 200) {
        sharedPreferences!
            .setString("accessToken", response.data["data"]["accessToken"]);
        sharedPreferences!
            .setString("refreshToken", response.data["data"]["refreshToken"]);
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  Future<bool> changeProfile(String userName, String email, String oldPassword,
      String newPassword) async {
    try {
      final response =
          await dio.post("/user", data: {'userName': userName, 'email': email});
      if (newPassword != "") {
      }
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  Future<User> getUser() async {
    try {
      final response = await dio.get("/user");
      User user = User.fromJson(response.data["data"]);
      return user;
    } on DioError {
      return const User(email: "", password: "", userName: "");
    }
  }

  Future<bool> Registration(String userName, String password, String email) async {
    try {
      final response = await dio.put("/token",
          data: {'userName': userName, 'password': password, 'email': email});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  Future<bool> deleteFinance(String id, int logicalDel) async {
    try {
      final Response response;
      if (logicalDel == 1) {
        response = await dio.delete("/finance/$id");
      } else {
        response =
            await dio.post("/finance/$id", queryParameters: {'action': 1});
      }
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }
}
