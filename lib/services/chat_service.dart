
import 'package:chat/global/enviroment.dart';
import 'package:chat/models/chat_response.dart';
import 'package:chat/models/user.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier{
  late User userfor;

  Future<List<Message>> getChat( String userID ) async {

    final resp = await http.get('${ Enviroment.apiUrl }/mensajes/$userID' as Uri,
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken().toString()
      }
    );

    final messagesResp = messagesResponseToJson(resp.body as MessagesResponse);

    return messagesResp.messages;

}
}