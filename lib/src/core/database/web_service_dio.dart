import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_entregas/src/core/exception/login_exception.dart';

class WebServiceDio {
  final Dio dio;

  WebServiceDio(this.dio);

  dynamic clientDio() {
    // dio.options.baseUrl = "http://localhost:5000";
    dio.options.baseUrl = "http://192.168.2.108:5000";
    dio.options.connectTimeout = 5000;
    dio.options.contentType = "application/json";
  }

  Future<dynamic> postResponseDio(String url, Map body) async {
    await clientDio();

    try {
      Response response = await dio.post(url, data: body);
      return checkResponse(response);
    } on DioError catch (e) {
      return checkResponse(e.response!);
    }
  }

  Future<dynamic> getResponseDio(String url) async {
    await clientDio();

    try {
      Response response = await dio.get(url);
      return checkResponse(response);
    } on DioError catch (e) {
      return checkResponse(e.response!);
    }
  }

  dynamic checkResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      // return "Requisição feita com sucesso.";
      case 201:
        return "Requisição feita com sucesso e dados criado com sucesso.";
      case 400:
        throw LoginException(response.data['message']);
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
