import 'package:flutter_entregas/src/modules/home_client/home_controller.dart';
import 'package:flutter_entregas/src/modules/home_client/home_page.dart';
import 'package:flutter_entregas/src/modules/home_client/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HomeRepository(i())),
        Bind.singleton((i) => HomeController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/delivery', child: (context, args) => const HomePage()),
      ];
}
