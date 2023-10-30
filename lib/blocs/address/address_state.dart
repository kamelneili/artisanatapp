// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:artisanaflutterapp/models/product.dart';

import '../../models/user_model.dart';

abstract class AddressState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends AddressState {
  List<Product> products;
  ProductLoadedState({this.products = const <Product>[]});
  @override
  List<Object> get props => [products];
}

class ProductLoadingState extends AddressState {}

class UserAddresssavedState extends AddressState {
  Map d;
  UserAddresssavedState({
    required this.d,
  });

  @override
  List<Object> get props => [];
}

class OrdersavedState extends AddressState {
  Map d;
  OrdersavedState({
    required this.d,
  });

  @override
  List<Object> get props => [d];
}

///***********************category products****************

class CategoryProductLoadedState extends AddressState {
  List<Product> products;
  CategoryProductLoadedState({this.products = const <Product>[]});
  @override
  List<Object> get props => [products];
}

class CategoryProductLoadingState extends AddressState {}

///*********** rate */
class ProductRatedState extends AddressState {}
