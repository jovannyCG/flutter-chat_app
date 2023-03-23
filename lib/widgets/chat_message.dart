import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({Key? key, required this.text, required this.id, required this.controller})
      : super(key: key);
  final String text;
  final String id;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller,
      child: SizeTransition(sizeFactor: CurvedAnimation(parent: controller, curve: Curves.easeOut),
      child: Container(child: id == '123' ? _myMessage() : _notMyMessage())));
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff4D9EF6)
        ),
        child: Text(text, style: const TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }

Widget  _notMyMessage() {
return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 5, left: 5, right: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffE4E5E8)
        ),
        child: Text(text, style: const TextStyle(
          color: Colors.black87
        ),),
      ),
    );
 }
}
