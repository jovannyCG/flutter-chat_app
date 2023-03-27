import 'package:chat/helpers/show_alert.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/button_blue.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
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
                  title: 'Registro',
                ),
                TextInput(
                  icon: Icons.perm_identity,
                  placeholder: 'User',
                  textcontroler: nameCtrl,
                  keyboardType: TextInputType.text,
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
                  pressed: authService.auth
                      ? null
                      : () async{
                        FocusScope.of(context).unfocus();
                        final registerOK = await  authService.register(
                              nameCtrl.text.trim(), emailCtrl.text.trim(), passCtrl.text.trim());
                        if(registerOK==true){
                          Navigator.pushReplacementNamed(context, 'usuarios');
                        }else{
                          showAlert(context, 'no fue posible realizar el registro', registerOK );
                        }
                        },
                  text: 'Crear cuenta',
                ),
                const Labels(
                  ruta: 'login',
                  title: '¿Ya tienes cuenta?',
                  subtitle: 'Ingresa Ahora',
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
