import 'package:flutter_entregas/src/core/local_storage/shared_preferences.dart';
import 'package:flutter_entregas/src/modules/home_client/home_controller.dart';
import 'package:flutter_entregas/src/modules/home_client/home_page.dart';
import 'package:flutter_entregas/src/modules/home_client/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        AsyncBind<SharedPreferences>((i) async => SharedPreferences.getInstance()),
        Bind.factory((i) => LocalStorage(i())),
        Bind.singleton((i) => HomeRepository(i())),
        Bind.singleton((i) => HomeController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/delivery', child: (context, args) => const HomePage()),
      ];
}
