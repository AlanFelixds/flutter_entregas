import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
      return response.data;
    } on DioError catch (e) {
      return manageResponse(e.response!);
    }
  }

  Future<dynamic> getResponseDio(String url) async {
    await clientDio();
    Response response = await dio.get(url);
    return manageResponse(response);
  }

  dynamic manageResponse(Response response) {
    debugPrint("${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw 'Não autorizado';
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
