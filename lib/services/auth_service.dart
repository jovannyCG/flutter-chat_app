import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:chat/global/enviroment.dart';
import 'package:chat/models/login_response.dart';
import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  late User user;
  bool _auth = false;
  bool get auth => _auth;
  final _storage = const FlutterSecureStorage();
  set auth(bool value) {
    _auth = value;
    notifyListeners();
  }

//getters del token estaticos
  static Future<String?> getToken() async {
    final _storage = const FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = const FlutterSecureStorage();
    await _storage.delete(key: 'token');
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
      await _saveToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }

  Future register(String name, String email, String password) async {
    auth = true;
    final data = {'name': name, 'email': email, 'password': password};

    final res = await http.post(
        Uri.parse(
          '${Enviroment.apiUrl}/login/new',
        ),
        body: jsonEncode(data),
        headers: {'Content-Type': 'aplication/json'});

    print(res.body);
    auth = false;
    if (res.statusCode == 200) {
      final loginResponse = loginResponseFromJson(res.body);
      user = loginResponse.user;
      await _saveToken(loginResponse.token);
      return true;
    } else {
      final resBody =jsonDecode(res.body);
      return resBody['msg'];
    }
  }

Future<bool?> isloggenIn()async{
  final token = await _storage.read(key: 'token');

}
  Future _saveToken(String token) async {
    await _storage.write(
      key: 'token',
      value: token,
    );
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }
}
