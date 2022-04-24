import 'package:dio/dio.dart';
import 'package:flutter_entregas/src/core/database/web_service.dart';
import 'package:flutter_entregas/src/core/database/web_service_dio.dart';
import 'package:flutter_entregas/src/core/local_storage/shared_preferences.dart';
import 'package:flutter_entregas/src/modules/home_client/home_module.dart';
import 'package:flutter_entregas/src/modules/login/login_controller.dart';
import 'package:flutter_entregas/src/modules/login/login_page.dart';
import 'package:flutter_entregas/src/modules/login/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        AsyncBind<SharedPreferences>((i) async => SharedPreferences.getInstance()),
        AsyncBind((i) async => LocalStorage(i())),
        Bind.factory((i) => WebService()),
        Bind.factory((i) => Dio()),
        Bind.factory((i) => WebServiceDio(i())),
        Bind.singleton((i) => LoginController(i())),
        Bind.singleton((i) => LoginRepository(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/login', child: (context, args) => LoginPage()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
