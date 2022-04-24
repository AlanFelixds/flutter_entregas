import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/models/product_model.dart';
import 'package:flutter_entregas/src/modules/home_client/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository;
  HomeController(this.homeRepository);

  final String? tt = null;

  TextEditingController itemNameController = TextEditingController();
  TextEditingController tempoController = TextEditingController(text: "2018-12-01 00:00:00.000");

  final Rx<DateTime> primeiroDia = DateTime.now().obs;
  final Rx<DateTime> ultimoDia = DateTime.now().obs;

  Future<void> createDelivery() async {
    ProductModel product = ProductModel();

    product.itemName = itemNameController.text;

    final result = await homeRepository.createDelivery(product);
    debugPrint('Home Controller ===> $result');
  }

  Future<void> calcularTempo() async {
    //2012-02-27 13:27:00
    final intDate = DateTime.parse(tempoController.text).millisecondsSinceEpoch;
    final result = await homeRepository.calcularData(intDate);

    primeiroDia.value = DateTime.fromMillisecondsSinceEpoch(result['primeiro']);
    ultimoDia.value = DateTime.fromMillisecondsSinceEpoch(result['ultimo']);
  }

  void goToCadastrarEventos() {
    Modular.to.pushNamed('/home/delivery');
  }
}
