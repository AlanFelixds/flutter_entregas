import 'package:flutter_entregas/src/core/database/web_service.dart';
import 'package:flutter_entregas/src/core/database/web_service_dio.dart';

class LoginRepository {
  WebServiceDio webService;
  LoginRepository(this.webService);

  Future<String> login(String username, String password) async {
    final String response = await webService.postResponseDio('/client/authenticate/', {
      'username': username,
      'password': password,
    });
    return response;
  }

  Future<dynamic> register(String username, String password) async {
    final response = await webService.postResponseDio('/client', {
      'username': username,
      'password': password,
    });
    return response;
  }
}
