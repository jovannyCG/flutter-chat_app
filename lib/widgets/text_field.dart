import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textcontroler;
  final TextInputType keyboardType;
  final bool isPassword;
  const TextInput(
      {Key? key,
      required this.icon,
      required this.placeholder,
      required this.textcontroler,
      this.keyboardType = TextInputType.text,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(0, 5),
                        blurRadius: 5)
                  ]),
              child:  TextField(
                autocorrect: false,
                keyboardType: keyboardType,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(icon),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: placeholder,
                ),
              )),
        ],
      ),
    );
  }
}
