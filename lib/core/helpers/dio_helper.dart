import 'package:dio/dio.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';

import '../../app.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(days: 1),
        validateStatus: (s) {
          return true;
        }));
  }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio!.get(url,
         options: Options(headers: headers));
  }

  static Future<Response> post(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      required data}) async {
    return await dio!.post(url,
         data: data,
        options: Options(headers: headers));
  }

  static Future<Response> put(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      required data}) async {
    return await dio!.put(url,
         data: data,
        options: Options(headers: headers));
  }

  static Future<Response> patch(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      data}) async {
    return await dio!.patch(url,
         data: data,
        options: Options(headers: headers));
  }

  static Future<Response> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio!.delete(url,
         options: Options(headers: headers));
  }
}
