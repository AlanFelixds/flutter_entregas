import 'package:flutter_entregas/src/core/database/web_service_dio.dart';

class SignupRepository {
  WebServiceDio webService;
  SignupRepository(this.webService);

  Future<dynamic> register(String username, String password) async {
    final response = await webService.postResponseDio('/client', {
      'username': username,
      'password': password,
    });
    return response;
  }
}
