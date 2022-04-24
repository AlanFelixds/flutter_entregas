import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/app_module.dart';
import 'package:flutter_entregas/src/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  Modular.setInitialRoute('/login');

  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
