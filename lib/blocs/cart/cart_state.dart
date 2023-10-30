// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {}

class SuccessAddingProductToCart extends CartState {
  Map data;
  SuccessAddingProductToCart({
    required this.data,
  });
  @override
  List<Object> get props => [data];
}

class SuccessRemovingProductToCart extends CartState {
  Map data;
  SuccessRemovingProductToCart({
    required this.data,
  });
  @override
  List<Object> get props => [data];
}

class CartLoaded extends CartState {
  // final Cart cart;

  // const CartLoaded({this.cart = const Cart()});

  // @override
  // List<Object> get props => [cart];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
