import 'dart:io';

import 'package:chat/global/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { online, offline, conecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.conecting;
  late IO.Socket _socket;
  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;
  Function get emit => socket.emit;

  

  void connect() {
    _socket = IO.io(Enviroment.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true
    });
    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });
    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });

    void disconnect(){
      _socket.disconnect();
    }

//socket.on('nuevo-mensaje', (payload) {
    //    print('nuevo-mensaje:');
    //  print('nombre:' + payload['nombre']);
    //print('mensaje:' + payload['mensaje']);
    //notifyListeners();
    //});
  }

  void disconnect() {
    _socket.disconnect();
  }
}