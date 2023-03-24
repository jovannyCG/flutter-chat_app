import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _textNode = FocusNode();
  bool _isWriting = false;

  final List<ChatMessages> _messages = [
    //  const ChatMessages(id: '123', text: 'hola', ),
    // const ChatMessages(id: '1266', text: 'hola', ),
    // const ChatMessages(id: '123', text: 'hola', ),
    // const ChatMessages(id: '1255', text: 'xd', ),
    //  const ChatMessages(id: '123', text: 'hola', ),
    // const ChatMessages(id: '123df', text: 'hola', ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: Column(children: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            maxRadius: 14,
            child: const Text('Te',
                style: TextStyle(
                  fontSize: 12,
                )),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text('Test 1',
              style: TextStyle(fontSize: 12, color: Colors.black87))
        ]),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, index) => _messages[index],
                reverse: true,
              ),
            ),
            const Divider(height: 1),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmmit,
            onChanged: (String texto) {
              setState(() {
                if (texto.trim().isNotEmpty) {
                  _isWriting = true;
                } else {
                  _isWriting = false;
                }
              });
            },
            decoration: const InputDecoration.collapsed(
              hintText: 'send message',
            ),
            focusNode: _textNode,
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Platform.isIOS
                ? CupertinoButton(
                    onPressed: _isWriting
                        ? () => _handleSubmmit(_textController.text.trim())
                        : null,
                    child: const Text('send'),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: IconTheme(
                      data: const IconThemeData(color: Colors.blue),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: _isWriting
                            ? () => _handleSubmmit(_textController.text.trim())
                            : null,
                        icon: const Icon(
                          Icons.send,
                        ),
                      ),
                    )),
          ),
        ],
      ),
    ));
  }

  _handleSubmmit(String text) {
    if (text.isEmpty) return;
    _textController.clear();
    _textNode.requestFocus();
    final chat = ChatMessages(
      id: '123',
      text: text,
      controller: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 800)),
    );

    _messages.insert(0, chat);
    chat.controller.forward();
    // print(text);
    setState(() {
      _isWriting = false;
    });
  }
  @override
  void dispose() {
    for(ChatMessages message in _messages){
      message.controller.dispose();
    }
    super.dispose();
  }
}
