// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:artisanaflutterapp/models/product.dart';

import '../../models/user_model.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends SearchState {
  List<Product> products;
  ProductLoadedState({this.products = const <Product>[]});
  @override
  List<Object> get props => [products];
}

class ProductLoadingState extends SearchState {}

class ProductLodingErrorState extends SearchState {
  final String message;
  ProductLodingErrorState(this.message);

  @override
  List<Object> get props => [message];
}

///***********************search products****************

class ProductSearchedState extends SearchState {
  List<Product> products;
  ProductSearchedState({
    required this.products,
  });
  @override
  List<Object> get props => [products];
}
