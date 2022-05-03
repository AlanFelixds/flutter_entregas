import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/app_module.dart';
import 'package:flutter_entregas/src/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Modular.setInitialRoute('/login');

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
  // runApp(FutureBuilder(
  //   future: Modular.isModuleReady<AppModule>(),
  //   builder: (context, snapshot) {
  //     if (snapshot.connectionState == ConnectionState.waiting) {
  //       print("object2");
  //     } else if (snapshot.connectionState == ConnectionState.done) {
  //       return ModularApp(
  //         module: AppModule(),
  //         child: const AppWidget(),
  //       );
  //     } else if (snapshot.connectionState == ConnectionState.active) {
  //     } else if (snapshot.connectionState == ConnectionState.none) {}

  //     return Container();
  //   },
  // ));
}
