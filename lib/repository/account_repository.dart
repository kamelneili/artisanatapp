import 'dart:convert';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/models/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccountRepository {
  final BASE_URL = "https://kamalshopapp.onrender.com";

  Future fetchMyOrders() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    //final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];

    http.Response res =
        await http.get(Uri.parse('$uri/api/orders/me'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'x-auth-token': '$token',
    });

    for (int i = 0; i < jsonDecode(res.body).length; i++) {
      orderList.add(
        Order.fromJson(
          jsonEncode(
            jsonDecode(res.body)[i],
          ),
        ),
      );
    }

    return orderList;
  }
}
