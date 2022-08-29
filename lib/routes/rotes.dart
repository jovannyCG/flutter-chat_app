import 'package:chat/pages/chat.dart';
import 'package:chat/pages/loading.dart';
import 'package:chat/pages/login.dart';
import 'package:chat/pages/register.dart';
import 'package:chat/pages/usuarios.dart';
import 'package:flutter/material.dart';

final Map<String,Widget Function(BuildContext)> appRotes = {
'usuarios': (_) =>const UsersPage(),
'chat': (_) =>const ChatPage(),
'login': (_) => LoginPage(),
'register': (_) => RegisterPage(),
'loading': (_) =>const LoadingPage(),
};