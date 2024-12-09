part of 'home_tap_cubit.dart';

abstract class HomeTabState extends Equatable {
  const HomeTabState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeTabState {}

class HomeCategoryLoadingState extends HomeTabState {}

class HomeCategoryFailureState extends HomeTabState {
  final String errMessage;

  const HomeCategoryFailureState({required this.errMessage});
}

class HomeCategorySucessState extends HomeTabState {
  final List<CategoryResponse> categoryList;
  const HomeCategorySucessState({required this.categoryList});
}

class HomeBrandLoadingState extends HomeTabState {}

class HomeBrandFailureState extends HomeTabState {
  final String errMessage;

  const HomeBrandFailureState({required this.errMessage});
}

class HomeBrandSucessState extends HomeTabState {
  final List<CategoryResponse> categoryList;
  const HomeBrandSucessState({required this.categoryList});
}
