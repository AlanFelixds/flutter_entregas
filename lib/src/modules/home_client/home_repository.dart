import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/database/web_service_dio.dart';
import 'package:flutter_entregas/src/core/models/product_model.dart';

class HomeRepository {
  WebServiceDio webService;
  HomeRepository(this.webService);

  Future<dynamic> createDelivery(ProductModel itemName) async {
    Map body = itemName.toMap();
    final response = await webService.postResponseDio('/delivery', body);
    debugPrint("$response");
  }

  Future<dynamic> calcularData(int tempo) async {
    final response =
        await webService.postResponseDio('/client/getTime', {"tempo": tempo});
    debugPrint("$response");
    return response;
  }
}
