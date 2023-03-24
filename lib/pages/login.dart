import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/button_blue.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Logo(
                  title: 'Messenger',
                ),
                TextInput(
                  icon: Icons.email,
                  placeholder: 'Email',
                  textcontroler: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                ),
                TextInput(
                  icon: Icons.lock,
                  placeholder: 'Password',
                  textcontroler: passCtrl,
                  isPassword: true,
                ),
                ButtonBlue(
                  text: 'Ingresa', 
                  pressed: () {  
                     // final authService =Provider.of<AuthService>(context, listen: false);
                     // authService.login( emailCtrl.text, passCtrl.text);
                     print(emailCtrl.text);
                      print(passCtrl.text);
                  },
                ),
                const Labels(ruta: 'register', title: '¿No tienes cuenta?',subtitle: 'Crea una ahora',),
                const Text('Términos y condiciones de uso',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w300)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
