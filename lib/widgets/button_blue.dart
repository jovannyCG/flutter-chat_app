
import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  final String text;
  
  final void Function()? pressed;
  const ButtonBlue({Key? key, required this.text, this.pressed, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      width: double.infinity,
      child: Center(
        child: ElevatedButton(
          onPressed: pressed,
          child:  Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
