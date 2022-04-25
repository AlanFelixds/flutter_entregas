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
    // dio.options.headers
  }

  Future<dynamic> postResponseDio(String url, Map body) async {
    await clientDio();
    Response response = await dio.post(url, data: body);
    debugPrint('POST RESPONSE => ${response.data}');
    // return manageResponse(response);
    return response.data;
  }

  Future<dynamic> getResponseDio(String url) async {
    await clientDio();
    Response response = await dio.get(url);
    debugPrint('GET RESPONSE => ${response.data}');
    // return manageResponse(response);
    return response.data;
  }
}
