import 'package:flutter_entregas/src/core/widgets/drawer/menu_list_tile.dart';
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
                  SizedBox(
                    width: 250,
                    child: Column(
                      children: [
                        MenuListTile(
                          title: 'Home',
                          onTap: () => Modular.to.pushNamed('./dashboard'),
                          selected: Modular.to.path.endsWith('/dashboard'),
                          trailing: const Icon(Icons.home),
                        ),
                        MenuListTile(
                          title: 'Solicitação',
                          onTap: () => Modular.to.pushNamed('./solicitacao'),
                          selected: Modular.to.path.endsWith('/solicitacao'),
                          trailing: const Icon(Icons.post_add_rounded),
                        ),
                        MenuListTile(
                          title: 'Solicitações',
                          onTap: () => Modular.to.pushNamed('./solicitacoes'),
                          selected: Modular.to.path.endsWith('/solicitacoes'),
                          trailing: const Icon(Icons.view_list_rounded),
                        ),
                        MenuListTile(
                          title: 'Sair',
                          onTap: () => Modular.to.pushNamed('/login'),
                          selected: Modular.to.path.endsWith('/login'),
                          trailing: const Icon(Icons.logout_rounded),
                        ),
                      ],
                    ),
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
