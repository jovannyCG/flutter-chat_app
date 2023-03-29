
import 'package:chat/global/enviroment.dart';
import 'package:chat/models/users_response.dart';
import 'package:chat/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:chat/models/user.dart';

class UsersService{
  Future <List<User>> getUsers()async{
    try{
    final resp = await http.get('${Enviroment.apiUrl}/users' as Uri,
    headers:{
      'content-Type':'application/json',
      'x-token': await AuthService.getToken().toString()
    }
    );
    final usersResponse =UsersResponse.fromJson(resp.body as Map<String, dynamic>);
      return usersResponse.users;
    }catch(e){
      return [];  
    }

  }
}