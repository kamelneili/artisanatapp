// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:artisanaflutterapp/models/product.dart';

import '../../models/user_model.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends HomeState {
  List<Product> products;
  ProductLoadedState({this.products = const <Product>[]});
  @override
  List<Object> get props => [products];
}

class ProductLoadingState extends HomeState {}

class ProductLodingErrorState extends HomeState {
  final String message;
  ProductLodingErrorState(this.message);

  @override
  List<Object> get props => [message];
}

///***********************category products****************

class CategoryProductLoadedState extends HomeState {
  List<Product> products;
  CategoryProductLoadedState({this.products = const <Product>[]});
  @override
  List<Object> get props => [products];
}

class CategoryProductLoadingState extends HomeState {}

///*********** rate */
class ProductRatedState extends HomeState {}
