import 'package:flutter_entregas/src/core/database/interface_web_client.dart';
import 'package:flutter_entregas/src/core/exception/login_exception.dart';
import 'package:get/get.dart';

class WebClientGet implements IWebClient {
  final GetConnect _iWebClient;

  WebClientGet(this._iWebClient);

  @override
  void clientConfiguration() {
    _iWebClient.httpClient.baseUrl = 'http://localhost:5000';
    _iWebClient.httpClient.timeout = const Duration(milliseconds: 5000);
    _iWebClient.httpClient.defaultContentType = 'application/json';
    _iWebClient.httpClient.addAuthenticator((dynamic request) async {
      Map<String, String> header = {"Authorization": "Beares token"};
      request.headers.addAll(header);
      return request;
    });
  }

  @override
  Future<dynamic> get({required String url}) async {
    clientConfiguration();
    final Response resultado = await _iWebClient.get(url);
    return checkResponse(resultado);
  }

  @override
  Future<dynamic> post({required String url, required Map body}) async {
    clientConfiguration();
    final Response resultado = await _iWebClient.post(url, body);
    return checkResponse(resultado);
  }

  dynamic checkResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 201:
        return "Requisição feita com sucesso e dados criado com sucesso.";
      case 400:
        throw LoginException(response.body['message']);
      case 401:
        return "Usuário não encontrado, verifique seu usuário e senha.";
      case 403:
        return "Usuário não autorizado, verifique com o administrador seu acesso ao conteúdo.";
      case 404:
        return "Recurso não encontrado.";
      case 500:
        return "Erro interno no servidor, tente novamente em alguns minutos.";
      default:
        throw 'Erro padrão, Throw.';
    }
  }
}
