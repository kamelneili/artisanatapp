import 'dart:convert';

import 'package:artisanaflutterapp/config/error_handling.dart';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/config/utils.dart';
import 'package:artisanaflutterapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  final BASE_URL = "https://kamalshopapp.onrender.com";

  Future fetchDealOfDay() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    var res = await http.get(Uri.parse('$BASE_URL/api/deal-of-day'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      //'x-auth-token': 'Bearer $token'
    });
    //
    List<Product> productList = [];
    for (int i = 0; i < jsonDecode(res.body).length; i++) {
      productList.add(
        Product.fromJson(
          jsonEncode(
            jsonDecode(res.body)[i],
          ),
        ),
      );
    }
    return productList;
  }

  ///* Category Products**********************
  Future<List<Product>> fetchCategoryProducts(String category) async {
    List<Product> productList = [];
    http.Response res = await http
        .get(Uri.parse('$BASE_URL/api/products?category=$category'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });

    for (int i = 0; i < jsonDecode(res.body).length; i++) {
      productList.add(
        Product.fromJson(
          jsonEncode(
            jsonDecode(res.body)[i],
          ),
        ),
      );
    }
    final d = json.decode(res.body);
    print(res.statusCode);
    if (res.statusCode == 200) {
      return productList;
    } else {
      print('error to add product');
    }
    print('productlist$productList');
    return productList;
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
    final d = json.decode(res.body);

    if (res.statusCode == 200) {
      return rating;
    } else {
      print('error to add product');
    }
  }
}
