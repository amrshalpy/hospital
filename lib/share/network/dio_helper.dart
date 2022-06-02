import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
        baseUrl: 'https://192.168.1.100:49/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {Map<String, dynamic>? data,  String? path, String? token}) async {
    dio.options.headers = {
      "accept": "*/*",
      "Authorization": "Bearer $token",
    };
    return await dio.get(path!, queryParameters: data);
  }

  static Future<Response> putData(
      {String? path, Map<String, dynamic>? data, String? token}) async {
    dio.options.headers = {
      "accept": "*/*",
      "Authorization": "Bearer $token",
    };
    return await dio.put(path!, data: data);
  }

  static Future<Response> postData(
      {String? path, Map<String, dynamic>? data, String? token}) async {
    dio.options.headers = {
      "Authorization": "Bearer ${token!}",
      'content-type': 'application/json',
    };
    return await dio.post(
      path!,
      queryParameters: data!,
    );
  }

  static Future<Response> deleteData(
      {String? path, Map<String, dynamic>? data, String? token}) async {
    dio.options.headers = {
      // 'content-type': 'application/json',
      "Authorization": "Bearer $token",
    };
    return await dio.delete(path!, queryParameters: data);
  }

  static Future<Response> patchData(
      {String? path, Map<String, dynamic>? data, String? token}) async {
    dio.options.headers = {
      "accept": "*/*",
      "Authorization": "Bearer $token",
    };
    return await dio.patch(path!, data: data);
  }
}
