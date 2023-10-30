import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  // ignore: non_constant_identifier_names
  final BASE_URL = "https://kamalshopapp.onrender.com";

  /// ****signup****************
  Future signup(String name, String email, String password) async {
    Map data = {"name": name, "password": password, "email": email};
    var body = json.encode(data);
    var res = await http.post(Uri.parse("$BASE_URL/api/signup"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    final d = json.decode(res.body);
    // print(d);

    if (res.statusCode == 200) {
      return d;
    } else {
      return "auth problem";
    }
  }

  /// ****login****************
  Future login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var res = await http.post(Uri.parse("$BASE_URL/api/signin"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    final d = json.decode(res.body);

    if (res.statusCode == 200) {
      return d;
    } else {
      return "auth problem";
    }
  }

  void logOut() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('token', '');
      await sharedPreferences.setString('x-auth-token', '');
      await sharedPreferences.clear();
    } catch (e) {}
  }
}
