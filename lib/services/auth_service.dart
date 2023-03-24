import 'dart:convert';

import 'package:chat/global/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  // final user

  Future login(String email, String password) async {
    final data = {'email': email, 'password': password};

    final res = await http.post(
        Uri.parse(
          '${Enviroment.apiUrl}/login',
        ),
        body: jsonEncode(data),
        headers: {'Content-Type': 'aplication/json'});
    print(res.body);
  }
}
