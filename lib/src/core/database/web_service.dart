import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/local_storage/shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

class WebService extends GetConnect {
  dynamic clientHttp() {
    httpClient.baseUrl = "http://localhost:5000";
    httpClient.defaultContentType = 'application/json';
    httpClient.timeout = const Duration(seconds: 120);

    httpClient.addAuthenticator((dynamic request) async {
      LocalStorage local = Modular.get<LocalStorage>();
      String? token = await local.read(chave: 'token');

      Map<String, String> headers = {'Authorization': "Bearer $token"};
      await request.headers.addAll(headers);
      return request;
    });
  }

  Future<dynamic> postResponse(String url, Map body) async {
    await clientHttp();
    Response response = await post(url, body);
    debugPrint('POST RESPONSE => ${response.body}');
    // return manageResponse(response);
    return response.body;
  }

  Future<dynamic> getResponse(String url) async {
    await clientHttp();
    Response response = await get(url);
    debugPrint('GET RESPONSE => $response');
    // return manageResponse(response);
    return response.body;
  }

  dynamic manageResponse(Response response) {
    debugPrint("${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw 'Bad request';
      case 401:
        throw 'Não autorizado';
      case 403:
        throw 'Não autorizado';
      case 500:
        throw 'Falha no servidor';
      default:
        throw 'THROW';
    }
  }
}
