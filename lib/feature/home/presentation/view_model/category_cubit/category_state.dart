part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryTapInitial extends CategoryState {}

class CategoryTapLoading extends CategoryState {}

class CategoryTapFailure extends CategoryState {
  final String errMessage;

  const CategoryTapFailure({required this.errMessage});
}

class CategoryTapSuccess extends CategoryState {
  final List<ProductModel> productsList;

  const CategoryTapSuccess({required this.productsList});
}

