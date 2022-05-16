import 'package:flutter_entregas/src/core/database/interface_web_client.dart';
import 'package:flutter_entregas/src/core/models/product_model.dart';

class SolicitacaoRepository {
  final IWebClient _webService;
  SolicitacaoRepository(this._webService);

  Future<dynamic> createDelivery(ProductModel itemName) async {
    Map body = itemName.toMap();
    final response = await _webService.post(url: '/delivery', body: body);
    return response;
  }

  Future<dynamic> buscarDeliveries() async {
    final response = await _webService.get(url: '/client/deliveries');
    return response;
  }
}
