import 'package:flutter_entregas/src/core/database/interface_web_client.dart';

class SignupRepository {
  final IWebClient _webService;
  SignupRepository(this._webService);

  Future<dynamic> register(String username, String password) async {
    final response = await _webService.post(url: '/client', body: {
      'username': username,
      'password': password,
    });
    return response;
  }
}
