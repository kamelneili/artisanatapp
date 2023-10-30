// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:artisanaflutterapp/models/order.dart';
import 'package:artisanaflutterapp/models/product.dart';
import 'package:artisanaflutterapp/screens/account/widgets/orders.dart';

import '../../models/user_model.dart';

abstract class AccountState extends Equatable {
  @override
  List<Object> get props => [];
}

class OrdersLoadedState extends AccountState {
  List<Order> orders;
  OrdersLoadedState({
    required this.orders,
  });
  @override
  List<Object> get props => [orders];
}

class OrdersLoadingState extends AccountState {}
