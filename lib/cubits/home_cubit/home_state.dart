part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeIdle extends HomeState {}

final class HomeLoading extends HomeState {}

final class CategoriesLoaded extends HomeState {
  final List<CategoryModel> categories;

  const CategoriesLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class CategoriesError extends HomeState {
  final CategoryRespondModel respond;

  const CategoriesError({required this.respond});

  @override
  List<Object> get props => [respond];
}

final class ProductsLoaded extends HomeState {
  final List<ProductModel> products;

  const ProductsLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

final class ProductsError extends HomeState {
  final ProductsRespondModel respond;

  const ProductsError({required this.respond});

  @override
  List<Object> get props => [respond];
}
