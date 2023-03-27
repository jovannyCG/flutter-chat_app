import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Center(
            child: Text('espere por favor'),
          );
        },
      ),
    );
  }
  Future checkLoginState(BuildContext context) async{
final authService = Provider.of<AuthService>(context);
  }
}
