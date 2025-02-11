import 'package:dio/dio.dart';

import '../../models/api_error_respond_model/api_error_respond_model.dart';
import '../../models/auth/login_model.dart';
import '../../models/auth_respond_model.dart';
import 'api_controller.dart';

class ApiHelper {
  static Future login(LoginModel request) async {
    final respond = await ApiController.postData('auth/login', request);
    if (respond is ApiErrorRespondModel) { 
      return respond;
    } else {
      return AuthRespondModel.fromMap(respond);
    }
  }

  static Future register(FormData request) async {
    final respond = await ApiController.postData('auth/register');
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return AuthRespondModel.fromMap(respond);
    }
  }

  static Future logout() async {
    final respond = await ApiController.postData('auth/logout');
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return respond['message'];
    }
  }
}
