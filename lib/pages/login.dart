import 'package:chat/helpers/show_alert.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/services/socket_service.dart';
import 'package:chat/widgets/button_blue.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(horizontal: 50),
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
                  textController: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                ),
                TextInput(
                  icon: Icons.lock,
                  placeholder: 'Password',
                  textController: passCtrl,
                  isPassword: true,
                ),
                ButtonBlue(
                  text: 'Ingresa',
                  pressed: authService.auth
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          final loginOK = await authService.login(
                              emailCtrl.text.trim(), passCtrl.text.trim());
                          if (loginOK) {
                            socketService.connect();
                            Navigator.pushReplacementNamed(context, 'usuarios');
                          } else {
                            showAlert(context, 'Error al iniciar sesión',
                                'Verifique que sus credemciales sean correctas');
                          }
                        },
                ),
                const Labels(
                  ruta: 'register',
                  title: '¿No tienes cuenta?',
                  subtitle: 'Crea una ahora',
                ),
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
