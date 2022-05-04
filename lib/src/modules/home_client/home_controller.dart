import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/models/product_model.dart';
import 'package:flutter_entregas/src/modules/home_client/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository;
  HomeController(this.homeRepository);

  TextEditingController itemNameController = TextEditingController();

  RxString nome = ''.obs;
  RxList deliveries = [].obs;

  Future<void> createDelivery() async {
    ProductModel product = ProductModel();
    product.itemName = itemNameController.text;
    await homeRepository.createDelivery(product);
  }

  Future<void> buscarDeliveries() async {
    deliveries.clear();
    final result = await homeRepository.buscarDeliveries();
    // nome.value = result[0]['username'];
    // debugPrint("${result[0]['deliveries']}");
    // deliveries.add(result[0]['deliveries']);
    deliveries.addAll(result[0]['deliveries']);
    debugPrint("${deliveries}");
  }

  void goToCadastrarEventos() {
    Modular.to.pushNamed('/home/delivery');
  }
}
