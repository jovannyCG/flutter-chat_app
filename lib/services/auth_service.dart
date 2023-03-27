import 'dart:convert';

import 'package:chat/global/enviroment.dart';
import 'package:chat/models/login_response.dart';
import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  late User user;
  bool _auth = false;
  bool get auth => _auth;
  set auth(bool value) {
    _auth = value;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    auth = true;
    final data = {'email': email, 'password': password};

    final res = await http.post(
        Uri.parse(
          '${Enviroment.apiUrl}/login',
        ),
        body: jsonEncode(data),
        headers: {'Content-Type': 'aplication/json'});
    print(res.body);
    auth = false;
    if (res.statusCode == 200) {
      final loginResponse = loginResponseFromJson(res.body);
      user = loginResponse.user;
      return true;
    } else {
      return false;
    }
  }
}
