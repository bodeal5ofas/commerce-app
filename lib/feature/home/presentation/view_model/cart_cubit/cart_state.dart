part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class GetCartProductsLoading extends CartState {}

class GetCartProductsFailure extends CartState {
  final String errMessage;

  const GetCartProductsFailure({required this.errMessage});
}

class GetCartProductsSuccess extends CartState {
  final GetCartProductResponse cartProductsResponse;

  const GetCartProductsSuccess({required this.cartProductsResponse});
}

class DeleteCartProductsLoading extends CartState {}

class DeleteCartProductsFailure extends CartState {
  final String errMessage;

  const DeleteCartProductsFailure({required this.errMessage});
}

class UpdateCartProductsLoading extends CartState {}

class UpdateCartProductsFailure extends CartState {
  final String errMessage;

  const UpdateCartProductsFailure({required this.errMessage});
}
