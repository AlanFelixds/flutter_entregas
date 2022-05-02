import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/database/web_service_dio.dart';
import 'package:flutter_entregas/src/core/models/product_model.dart';

class HomeRepository {
  final WebServiceDio _webService;
  HomeRepository(this._webService);

  Future<dynamic> createDelivery(ProductModel itemName) async {
    Map body = itemName.toMap();
    final response = await _webService.postResponseDio('/delivery', body);
    debugPrint("$response");
  }

  Future<dynamic> buscarDeliveries() async {
    final response = await _webService.getResponseDio('/client/deliveries');
    debugPrint("$response");
  }

  @Deprecated("não utilizada no momento")
  Future<dynamic> calcularData(int tempo) async {
    final response = await _webService.postResponseDio('/client/getTime', {"tempo": tempo});
    debugPrint("$response");
    return response;
  }
}
