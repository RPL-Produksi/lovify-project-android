import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lovify_android/models/category_model/category_model.dart';
import 'package:lovify_android/models/category_model/category_respond_model.dart';
import 'package:lovify_android/service/api/api_controller.dart';
import 'package:lovify_android/service/api/api_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<CategoryModel> categories = [];

  void isInit() => emit(HomeInitial());

  void isIdle() => emit(HomeIdle());

  void getCategories() async {
    if (ApiController.token.toString().isEmpty) {
      emit(CategoriesError(
          respond: CategoryRespondModel(
        status: 'Failed',
        message: 'Token empty',
      )));
      return;
    }
    emit(HomeLoading());
    final respond = await ApiHelper.getCategories();
    if (respond is CategoryRespondModel) {
      final data = respond.data;
      if (data != null) {
        categories = data;
        emit(CategoriesLoaded(categories: data));
        return;
      } else {
        categories = [];
        emit(CategoriesLoaded(categories: []));
        return;
      }
    }
    if (respond is CategoryRespondModel) {
      emit(CategoriesError(respond: respond));
      return;
    }
  }
}
