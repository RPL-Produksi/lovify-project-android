import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lovify_android/models/category_model/category_model.dart';
import 'package:lovify_android/models/category_model/category_respond_model.dart';
import 'package:lovify_android/models/products_respond_model/product_model.dart';
import 'package:lovify_android/models/products_respond_model/products_respond_model.dart';
import 'package:lovify_android/service/api/api_controller.dart';
import 'package:lovify_android/service/api/api_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<CategoryModel> categories = [CategoryModel(name: 'All Categories')];
  List<ProductModel> products = [];

  void isInit() => emit(HomeInitial());

  void isIdle() => emit(HomeIdle());

  void getCategories() async {
    if (ApiController.token.toString().isEmpty) {
      emit(
        CategoriesError(
          respond: CategoryRespondModel(
            status: 'Failed',
            message: 'Token empty',
          ),
        ),
      );
      return;
    }
    emit(HomeLoading());
    final respond = await ApiHelper.getCategories();
    if (respond is CategoryRespondModel) {
      final data = respond.data;
      if (data != null) {
        if (categories.length > 1) categories.removeRange(2, categories.length);
        categories.addAll(data);
        emit(CategoriesLoaded(categories: data));
        return;
      } else {
        categories.removeRange(2, categories.length);
        emit(CategoriesLoaded(categories: []));
        return;
      }
    }
    if (respond is CategoryRespondModel) {
      emit(CategoriesError(respond: respond));
      return;
    }
  }

  void getProducts({
    String? id,
    String? category,
    String? vendorId,
  }) async {
    if (ApiController.token.toString().isEmpty) {
      emit(
        ProductsError(
          respond: ProductsRespondModel(
            status: 'Failed',
            message: 'Token empty',
          ),
        ),
      );
      return;
    }
    emit(HomeLoading());
    final respond = await ApiHelper.getProducts(
      id: id,
      category: category,
      vendorId: vendorId,
    );
    if (respond is ProductsRespondModel) {
      final data = respond.data;
      if (data != null) {
        products = data;
        emit(ProductsLoaded(products: data));
        return;
      } else {
        products = [];
        emit(ProductsLoaded(products: []));
        return;
      }
    }
    if (respond is ProductsRespondModel) {
      emit(ProductsError(respond: respond));
      return;
    }
  }
}
