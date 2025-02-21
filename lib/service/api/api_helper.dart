import 'package:dio/dio.dart';
import 'package:lovify_android/models/category_model/category_respond_model.dart';
import 'package:lovify_android/models/products_respond_model/products_respond_model.dart';

import '../../models/api_error_respond_model/api_error_respond_model.dart';
import '../../models/auth/login_model.dart';
import '../../models/auth_respond_model.dart';
import 'api_controller.dart';

class ApiHelper {
  // Auth
  static Future login(LoginModel request) async {
    final respond =
        await ApiController.postData('auth/login', request.toJson());
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return AuthRespondModel.fromMap(respond['data']);
    }
  }

  static Future register(FormData request) async {
    final respond = await ApiController.postData('auth/register', request);
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return AuthRespondModel.fromMap(respond['data']);
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

  // Category
  static Future getCategories() async {
    final respond = await ApiController.getData('home/categories');
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return CategoryRespondModel.fromMap(respond);
    }
  }

  // Product
  static Future getProducts() async {
    final respond = await ApiController.getData('products');
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      ProductsRespondModel.fromMap(respond);
    }
  }
}
