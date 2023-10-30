import 'dart:convert';

import 'package:artisanaflutterapp/config/error_handling.dart';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/config/utils.dart';
import 'package:artisanaflutterapp/models/product.dart';
import 'package:artisanaflutterapp/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddressRepository {
  final BASE_URL = "https://kamalshopapp.onrender.com";

  Future saveUserAddress(
    String address,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("removing");
    String? token = pref.getString('token');

    http.Response res = await http.post(
      Uri.parse('$uri/api/save-user-address'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': '$token',
      },
      body: jsonEncode({
        'address': address,
      }),
    );

    final d = json.decode(res.body);
    print("address:$d");
    if (res.statusCode == 200) {
      return d;
    } else {
      print('error to add address');
    }
  }

  ///* save order **********************
  Future placeOrder(String address, double totalSum, List cart) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? token = pref.getString('token');

    http.Response res = await http.post(Uri.parse('$BASE_URL/api/order'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': '$token',
        },
        body: jsonEncode({
          'cart': cart,
          'address': address,
          'totalPrice': totalSum,
        }));
    final d = json.decode(res.body);

    if (res.statusCode == 200) {
      return d;
    }
  }

  ///*****************************Rating************* */
  Future rateProduct(
    Product product,
    double rating,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    http.Response res = await http.post(
      Uri.parse('$BASE_URL/api/rate-product'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': '$token',
      },
      body: jsonEncode({
        'id': product.id!,
        'rating': rating,
      }),
    );
  }
}
