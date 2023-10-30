// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

abstract class AccountEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadOrdersEvent extends AccountEvents {}

class LoadingOrdersEvent extends AccountEvents {
  @override
  List<Object> get props => [];
}
