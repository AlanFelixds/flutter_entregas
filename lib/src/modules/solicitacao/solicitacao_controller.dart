import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/models/product_model.dart';
import 'package:flutter_entregas/src/modules/solicitacao/solicitacao_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

class SolicitacaoController extends GetxController {
  SolicitacaoRepository solicitacaoRepository;
  SolicitacaoController(this.solicitacaoRepository);

  TextEditingController itemNameController = TextEditingController();

  RxString nome = ''.obs;
  RxList deliveries = [].obs;

  Future<void> createDelivery() async {
    ProductModel product = ProductModel();
    product.itemName = itemNameController.text;
    await solicitacaoRepository.createDelivery(product);
  }

  Future<void> buscarDeliveries() async {
    deliveries.clear();
    final result = await solicitacaoRepository.buscarDeliveries();
    deliveries.addAll(result[0]['deliveries']);
  }

  void goToCadastrarEventos() {
    Modular.to.pushNamed('/solicitacao/delivery');
  }
}
