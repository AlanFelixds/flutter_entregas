import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/database/interface_web_client.dart';
import 'package:flutter_entregas/src/core/exception/login_exception.dart';
import 'package:flutter_entregas/src/core/storage/local.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WebClientDio implements IWebClient {
  final Dio _webDio;

  WebClientDio(this._webDio);

  @override
  dynamic clientConfiguration() async {
    final local = Modular.get<Local>();
    final token = await local.read(chave: 'token');

    _webDio.options.baseUrl = "http://localhost:5000";
    _webDio.options.contentType = "application/json";
    _webDio.options.headers["Authorization"] = "Beares $token";
  }

  @override
  Future<dynamic> post({required String url, required Map body}) async {
    await clientConfiguration();
    final Response result = await _webDio.post(url, data: body);
    return checkResponse(result);
  }

  @override
  Future<dynamic> get({required String url}) async {
    await clientConfiguration();
    final Response result = await _webDio.get(url);
    return checkResponse(result);
  }

  Future<dynamic> checkResponse(Response response) async {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return "Requisição feita com sucesso e dados criado com sucesso.";
      case 400:
        throw LoginException(response.data['message']);
      case 401:
        debugPrint("${response.headers}");
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
