part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeChangeTapeState extends HomeState {}

class AddtoCartLoading extends HomeState {}

class AddtoCartFailure extends HomeState {
  final String errMessage;

  const AddtoCartFailure({required this.errMessage});
}

class AddtoCartSuccess extends HomeState {
  final AddProductCartResponse productCartResponse;

  const AddtoCartSuccess({required this.productCartResponse});
}


