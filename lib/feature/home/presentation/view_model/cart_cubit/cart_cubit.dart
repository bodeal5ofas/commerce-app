import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/get_cart_product_response/get_cart_product_response.dart';
import 'package:ecommerce_app/feature/home/data/repo/cart_repo/cart_repo.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  CartRepo cartRepo;
  getCartProduct() async {
    emit(GetCartProductsLoading());

    var result = await cartRepo.getCartProducts();
    result.fold(
      (error) {
        emit(GetCartProductsFailure(errMessage: error.errorMessage));
      },
      (response) {
        emit(GetCartProductsSuccess(cartProductsResponse: response));
      },
    );
  }

    updateCartProduct({required String productId,required int count}) async {
    emit(UpdateCartProductsLoading());

    var result = await cartRepo.updateCartProducts(productId: productId,count: count);
    result.fold(
      (error) {
        emit(UpdateCartProductsFailure(errMessage: error.errorMessage));
      },
      (response) {
        emit(GetCartProductsSuccess(cartProductsResponse: response));
      },
    );
  }

  deleteCartProduct({required String productId}) async {
    emit(DeleteCartProductsLoading());

    var result = await cartRepo.deleteCartProduct(productId: productId);
    result.fold(
      (error) {
        emit(DeleteCartProductsFailure(errMessage: error.errorMessage));
      },
      (response) {
        emit(GetCartProductsSuccess(cartProductsResponse: response));
      },
    );
  }
}
