import 'package:flutter_entregas/src/core/database/web_service_dio.dart';

class LoginRepository {
  WebServiceDio webService;
  LoginRepository(this.webService);

  Future<dynamic> login(String username, String password) async {
    final response = await webService.postResponseDio('/client/authenticate/', {
      'username': username,
      'password': password,
    });
    print(response);
    return response;
  }
  // Future<String> login(String username, String password) async {
  //   final response = await webService.postResponseDio('/client/authenticate/', {
  //     'username': username,
  //     'password': password,
  //   });
  //   print(response);
  //   return response;
  // }

  Future<dynamic> register(String username, String password) async {
    final response = await webService.postResponseDio('/client', {
      'username': username,
      'password': password,
    });
    return response;
  }
}
