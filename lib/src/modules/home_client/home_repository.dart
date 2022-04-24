import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/database/web_service.dart';
import 'package:flutter_entregas/src/core/models/product_model.dart';

class HomeRepository {
  WebService webService;
  HomeRepository(this.webService);

  Future<dynamic> createDelivery(ProductModel itemName) async {
    Map body = itemName.toMap();
    final response = await webService.postResponse('/delivery', body);
    debugPrint("$response");
  }

  Future<dynamic> calcularData(int tempo) async {
    final response = await webService.postResponse('/client/getTime', {"tempo": tempo});
    debugPrint("$response");
    return response;
  }
}
