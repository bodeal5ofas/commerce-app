part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}
//class AddtoFavoriteLoading extends FavoriteState {}

class AddtoFavoriteFailure extends FavoriteState {
  final String errMessage;

  const AddtoFavoriteFailure({required this.errMessage});
}

class AddtoFavoriteSuccess extends FavoriteState {
  final AddToFavoriteResponse response;

  const AddtoFavoriteSuccess({required this.response});
}

class DeleteFavoriteFailure extends FavoriteState {
  final String errMessage;

  const DeleteFavoriteFailure({required this.errMessage});
}

class DeleteFavoriteSuccess extends FavoriteState {
  final AddToFavoriteResponse response;

  const DeleteFavoriteSuccess({required this.response});
}

class GetAllFavoriteLoading extends FavoriteState {}

class GetAllFavoriteFailure extends FavoriteState {
  final String errMessage;

  const GetAllFavoriteFailure({required this.errMessage});
}

class GetAllFavoriteSuccess extends FavoriteState {
  final List<ProductModel> products;

  const GetAllFavoriteSuccess({required this.products});
}
