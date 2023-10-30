// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:artisanaflutterapp/models/order.dart';
import 'package:equatable/equatable.dart';

abstract class AdminEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadOrdersEvent extends AdminEvents {}

class LoadingOrdersEvent extends AdminEvents {
  @override
  List<Object> get props => [];
}

class ChangeOrderStatusEvent extends AdminEvents {
  int status;
  Order order;
  // VoidCallback onSuccess;
  ChangeOrderStatusEvent({
    required this.status,
    required this.order,
    //required this.onSuccess,
  });
  @override
  List<Object> get props => [order, status];
}
