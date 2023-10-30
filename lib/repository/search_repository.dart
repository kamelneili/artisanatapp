import 'dart:convert';

import 'package:artisanaflutterapp/config/error_handling.dart';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/config/utils.dart';
import 'package:artisanaflutterapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchRepository {
  final BASE_URL = "https://kamalshopapp.onrender.com";

  Future fetchSearchedProduct(String searchQuery) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    var res = await http
        .get(Uri.parse('$BASE_URL/api/products/search/$searchQuery'), headers: {
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
}
