import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/modules/root/root_page.dart';
import 'package:flutter_entregas/src/modules/solicitacao/solicitacao_controller.dart';
import 'package:flutter_entregas/src/modules/solicitacao/solicitacao_page.dart';
import 'package:flutter_entregas/src/modules/solicitacao/solicitacao_repository.dart';
import 'package:flutter_entregas/src/modules/solicitacoes/solicitacoes_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RootModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //HOME
        Bind.singleton((i) => SolicitacaoController(i())),
        Bind.singleton((i) => SolicitacaoRepository(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const RootPage(),
          children: [
            ChildRoute('/dashboard/', child: (context, args) => Container(color: Colors.pink)),
            ChildRoute('/solicitacao/', child: (context, args) => const SolicitacaoPage()),
            ChildRoute('/solicitacoes/', child: (context, args) => const SolicitacoesPage()),
          ],
        ),
      ];
}
