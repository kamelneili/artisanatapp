// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:artisanaflutterapp/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:artisanaflutterapp/models/product.dart';
import 'package:artisanaflutterapp/repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;
  CartBloc({required cartRepository})
      : _cartRepository = cartRepository,
        super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  Future<void> _onAddProduct(
    AddProduct event,
    Emitter<CartState> emit,
  ) async {
    var data = await _cartRepository.addToCart(event.product);

    emit(SuccessAddingProductToCart(data: data));
  }

  Future<void> _onRemoveProduct(
    RemoveProduct event,
    Emitter<CartState> emit,
  ) async {
    var data = await _cartRepository.removeFromCart(event.product);

    emit(SuccessRemovingProductToCart(data: data));
  }
}
