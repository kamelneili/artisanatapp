import 'dart:convert';

import 'package:artisanaflutterapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  final BASE_URL = "https://kamalshopapp.onrender.com";

  Future addToCart(Product product) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'x-auth-token': '$token'
    };
    http.Response res = await http.post(
      Uri.parse('$BASE_URL/api/add-to-cart'),
      headers: requestHeaders,
      body: jsonEncode({
        'id': product.id!,
      }),
    );
    final d = json.decode(res.body);
    if (res.statusCode == 200) {
      return d;
    } else {
      print('error to add product');
    }
  }

  ///*********** Remove product from cart */
  Future removeFromCart(Product product) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'x-auth-token': '$token'
    };
    http.Response res = await http.delete(
      Uri.parse('$BASE_URL/api/remove-from-cart/${product.id}'),
      headers: requestHeaders,
    );
    final d = json.decode(res.body);
    if (res.statusCode == 200) {
      return d;
    } else {
      print('error to remove product');
    }
  }
}
