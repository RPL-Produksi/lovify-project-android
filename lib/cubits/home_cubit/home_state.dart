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
