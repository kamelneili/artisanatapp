// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:equatable/equatable.dart';

import 'package:artisanaflutterapp/models/product.dart';

abstract class AddressEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProductEvent extends AddressEvents {}

class LoadingProductEvent extends AddressEvents {
  @override
  List<Object> get props => [];
}

class LoadCategoryProductEvent extends AddressEvents {
  String category;
  LoadCategoryProductEvent({
    required this.category,
  });
  @override
  List<Object> get props => [category];
}

class LoadingCategoryProductEvent extends AddressEvents {
  @override
  List<Object> get props => [];
}

class DisplayRateProductEvent extends AddressEvents {}

class SaveUserAddressEvent extends AddressEvents {
  String address;
  SaveUserAddressEvent(
    this.address,
  );
  @override
  List<Object> get props => [address];
}

class SaveOrderEvent extends AddressEvents {
  List cart;
  double totalSum;
  String address;
  SaveOrderEvent(this.cart, this.totalSum, this.address);
  @override
  List<Object> get props => [
        address,
        cart,
        totalSum,
      ];
}
