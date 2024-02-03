import 'package:dio/dio.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
         connectTimeout:Duration(days: 1) ,
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
        queryParameters: queryParameters, options: Options(headers: headers));
  }

  static Future<Response> post(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      required data}) async {
    return await dio!.post(url,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers));
  }
  static Future<Response> put(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      required data}) async {
    return await dio!.put(url,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers));
  }
}
