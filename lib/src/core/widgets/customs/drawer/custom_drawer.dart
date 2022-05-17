import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/widgets/customs/drawer/menu_list_tile.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationListener(
      builder: (context, child) {
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
                      onTap: () => Modular.to.pushNamed('/home/dashboard/'),
                      selected: Modular.to.path.endsWith('/dashboard/'),
                      trailing: const Icon(Icons.home),
                    ),
                    MenuListTile(
                      title: 'Solicitar certificado',
                      onTap: () => Modular.to.pushNamed('/home/solicitar_certificado/'),
                      selected: Modular.to.path.endsWith('/solicitar_certificado/'),
                      trailing: const Icon(Icons.post_add_rounded),
                    ),
                    MenuListTile(
                      title: 'Sair',
                      onTap: () => Modular.to.popAndPushNamed('/login'),
                      trailing: const Icon(Icons.logout_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
