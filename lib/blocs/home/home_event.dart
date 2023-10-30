// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:equatable/equatable.dart';

import 'package:artisanaflutterapp/models/product.dart';

abstract class HomeEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProductEvent extends HomeEvents {}

class LoadingProductEvent extends HomeEvents {
  @override
  List<Object> get props => [];
}

class DisplayRateProductEvent extends HomeEvents {}

class RateProductEvent extends HomeEvents {
  double rate;
  Product product;
  RateProductEvent({
    required this.rate,
    required this.product,
  });
  @override
  List<Object> get props => [product, rate];
}
