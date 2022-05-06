import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Row(
        children: [
          NavigationListener(builder: (context, child) {
            return SizedBox(
              width: 300,
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Home"),
                    selected: Modular.to.path.endsWith('/dashboard'),
                    selectedTileColor: Colors.blueGrey[800],
                    hoverColor: Colors.white,
                    onTap: () {
                      Modular.to.pushNamed('./dashboard');
                    },
                  ),
                  ListTile(
                    title: const Text("Solicitar"),
                    selected: Modular.to.path.endsWith('/solicitacao'),
                    selectedTileColor: Colors.blueGrey[800],
                    hoverColor: Colors.white,
                    onTap: () {
                      Modular.to.pushNamed('./solicitacao');
                    },
                  ),
                  ListTile(
                    title: const Text("Solicitaçóes"),
                    selected: Modular.to.path.endsWith('/solicitacoes'),
                    selectedTileColor: Colors.blueGrey[800],
                    hoverColor: Colors.white,
                    onTap: () {
                      Modular.to.pushNamed('./solicitacoes');
                    },
                  ),
                ],
              ),
            );
          }),
          const Expanded(child: RouterOutlet())
        ],
      ),
    );
  }
}
