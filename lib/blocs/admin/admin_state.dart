// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:artisanaflutterapp/models/order.dart';
import 'package:artisanaflutterapp/models/product.dart';

import '../../models/user_model.dart';

abstract class AdminState extends Equatable {
  @override
  List<Object> get props => [];
}

class OrdersLoadedState extends AdminState {
  List<Order> orders;
  OrdersLoadedState({
    required this.orders,
  });
  @override
  List<Object> get props => [orders];
}

class StartStatusState extends AdminState {}

class OrderStatusChangedState extends AdminState {
  int data;
  OrderStatusChangedState({
    required this.data,
  });
  @override
  List<Object> get props => [data];
}
