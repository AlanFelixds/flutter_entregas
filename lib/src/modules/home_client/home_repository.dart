import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/database/interface_web_client.dart';
import 'package:flutter_entregas/src/core/models/product_model.dart';

class HomeRepository {
  final IWebClient _webService;
  HomeRepository(this._webService);

  Future<dynamic> createDelivery(ProductModel itemName) async {
    Map body = itemName.toMap();
    final response = await _webService.post(url: '/delivery', body: body);
    debugPrint("$response");
  }

  Future<dynamic> buscarDeliveries() async {
    final response = await _webService.get(url: '/client/deliveries');
    debugPrint("$response");
  }
}
