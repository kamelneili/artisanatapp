import 'dart:convert';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AdminRepository {
  final BASE_URL = "https://kamalshopapp.onrender.com";

  Future changeOrderStatus({
    required int status,
    required Order order,
  }) async {
    print('changeorderstatus');
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("statusrepo");
    String? token = pref.getString('token');

    http.Response res = await http.post(
      Uri.parse('$uri/admin/change-order-status'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': '$token',
      },
      body: jsonEncode({
        'id': order.id,
        'status': status,
      }),
    );
    print('res:$res');
    if (res.statusCode == 200) {
      print(status);

      return status += 1;
    }
  }
}
