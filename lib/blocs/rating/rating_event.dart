// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:equatable/equatable.dart';

import 'package:artisanaflutterapp/models/product.dart';

abstract class RatingEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class RateProductEvent extends RatingEvents {
  double rate;
  Product product;
  RateProductEvent({
    required this.rate,
    required this.product,
  });
  @override
  List<Object> get props => [product, rate];
}
