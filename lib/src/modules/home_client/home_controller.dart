import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/models/product_model.dart';
import 'package:flutter_entregas/src/modules/home_client/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository;
  HomeController(this.homeRepository);

  TextEditingController itemNameController = TextEditingController();

  Future<void> createDelivery() async {
    ProductModel product = ProductModel();
    product.itemName = itemNameController.text;
    final result = await homeRepository.createDelivery(product);
    debugPrint('Create delivery ===> $result');
  }

  Future<void> buscarDeliveries() async {
    final result = await homeRepository.buscarDeliveries();
    debugPrint('buscar todos deliveries ===> $result');
  }

  void goToCadastrarEventos() {
    Modular.to.pushNamed('/home/delivery');
  }
}
