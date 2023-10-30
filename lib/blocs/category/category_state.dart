// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:artisanaflutterapp/models/product.dart';

import '../../models/user_model.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

///***********************category products****************

class CategoryProductLoadedState extends CategoryState {
  List<Product> products;
  CategoryProductLoadedState({this.products = const <Product>[]});
  @override
  List<Object> get props => [products];
}

class CategoryProductLoadingState extends CategoryState {}
