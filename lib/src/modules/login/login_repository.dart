import 'package:flutter_entregas/src/core/database/interface_web_client.dart';

class LoginRepository {
  final IWebClient _webService;
  LoginRepository(this._webService);

  Future<dynamic> login(String username, String password) async {
    final response = await _webService.post(url: '/client/authenticate/', body: {
      'username': username,
      'password': password,
    });
    return response;
  }
}
