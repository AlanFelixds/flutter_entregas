import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/modules/home_client/home_page.dart';
import 'package:flutter_entregas/src/modules/root/root_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RootModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const RootPage(), children: [
          ChildRoute('/dashboard', child: (context, args) => Container(color: Colors.pink)),
          ChildRoute('/solicitacao', child: (context, args) => const HomePage()),
          ChildRoute('/solicitacoes', child: (context, args) => Container(color: Colors.yellow)),
        ])
      ];
}
