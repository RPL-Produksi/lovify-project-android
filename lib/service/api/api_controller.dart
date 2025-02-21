import 'package:dio/dio.dart';
import 'package:lovify_android/models/api_error_respond_model/api_error_respond_model.dart';

import 'api_exception.dart';

class ApiController {
  static const baseUrl = "http://10.10.10.101:83";
  static String? token;

  static var dio = Dio(
    BaseOptions(
      baseUrl: "$baseUrl/api/v1/",
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {"Accept": "application/json"},
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    ),
  );

  static Map<String, dynamic> checkException(DioException ex) {
    ApiException exception = ApiException();
    return exception.apiException(ex);
  }

  static Future getData(String url) async {
    try {
      final respond = await dio.get(
        url,
        options: token != null
            ? Options(headers: {'Authorization': 'Bearer $token'})
            : null,
      );
      return respond.data;
    } on DioException catch (e) {
      final error = checkException(e);
      return ApiErrorRespondModel.fromMap(error);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future postData(String url,
      [dynamic data, String? extraHeaders]) async {
    try {
      final respond = await dio.post(
        url,
        data: data,
        options: token != null
            ? Options(
                headers: {'Authorization': 'Bearer $token'},
                contentType: extraHeaders ?? Headers.jsonContentType,
              )
            : null,
      );
      return respond.data;
    } on DioException catch (e) {
      final error = checkException(e);
      return ApiErrorRespondModel.fromMap(error);
    } catch (e) {
      throw Exception(e);
    }
  }
}
