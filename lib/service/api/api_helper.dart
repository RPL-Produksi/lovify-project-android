import 'package:dio/dio.dart';
import 'package:lovify_android/models/category_model/category_respond_model.dart';
import 'package:lovify_android/models/order_respond_model/order_respond_model.dart';
import 'package:lovify_android/models/planning_respond_model/planning_request_model.dart';
import 'package:lovify_android/models/planning_respond_model/planning_respond_model.dart';
import 'package:lovify_android/models/products_respond_model/products_respond_model.dart';

import '../../models/api_error_respond_model/api_error_respond_model.dart';
import '../../models/auth/login_model.dart';
import '../../models/auth_respond_model.dart';
import 'api_controller.dart';

class ApiHelper {
  // Auth
  static Future login(LoginModel request) async {
    final respond =
        await ApiController.postData(url: 'auth/login', data: request.toJson());
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return AuthRespondModel.fromMap(respond['data']);
    }
  }

  static Future register(FormData request) async {
    final respond =
        await ApiController.postData(url: 'auth/register', data: request);
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return AuthRespondModel.fromMap(respond['data']);
    }
  }

  static Future logout() async {
    final respond = await ApiController.postData(url: 'auth/logout');
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return respond['message'];
    }
  }

  // Category
  static Future getCategories() async {
    final respond = await ApiController.getData(url: 'categories');
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return CategoryRespondModel.fromMap(respond);
    }
  }

  // Product
  static Future getProducts(String? id) async {
    final respond = await ApiController.getData(url: id == null ? 'products' : 'products/$id');
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return ProductsRespondModel.fromMap(respond);
    }
  }

  static Future getProductsByCategory(String category) async {
    final respond = await ApiController.getData(
      url: 'products',
      params: {'category': category},
    );
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return ProductsRespondModel.fromMap(respond);
    }
  }

  static Future getProductsByVendorId(int vendorId) async {
    final respond = await ApiController.getData(
      url: 'products',
      params: {'vendoId': vendorId},
    );
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return ProductsRespondModel.fromMap(respond);
    }
  }

  // Planning
  static Future getPlanning() async {
    final respond = await ApiController.getData(url: 'plannings');
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return PlanningRespondModel.fromMap(respond);
    }
  }

  static Future postPlanning(PlanningRequestModel request) async {
    final respond = await ApiController.postData(
      url: 'plannings',
      data: request.toMap(),
    );
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return PlanningRespondModel.fromMap(respond);
    }
  }

  static Future deletePlanning(String planningId) async {
    final respond = await ApiController.deleteData(url: 'planning/$planningId');
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return PlanningRespondModel.fromMap(respond);
    }
  }

  // Order
  static Future getOrders() async {
    final respond = await ApiController.getData(url: 'clients/orders');
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return OrderRespondModel.fromMap(respond);
    }
  }

  static Future postOrder(
      {required String planningId, required String marryDate}) async {
    final respond = await ApiController.postData(
      url: 'clients/orders',
      data: {'marry_date': marryDate},
    );
    if (respond is ApiErrorRespondModel) {
      return respond;
    } else {
      return OrderRespondModel.fromMap(respond);
    }
  }

  // TODO: Transaction
}
