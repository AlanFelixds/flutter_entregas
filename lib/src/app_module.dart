import 'package:dio/dio.dart';
import 'package:flutter_entregas/src/core/database/interface_web_client.dart';
import 'package:flutter_entregas/src/core/database/web_client_dio.dart';
import 'package:flutter_entregas/src/core/storage/local.dart';
import 'package:flutter_entregas/src/modules/login/login_controller.dart';
import 'package:flutter_entregas/src/modules/login/login_page.dart';
import 'package:flutter_entregas/src/modules/login/login_repository.dart';
import 'package:flutter_entregas/src/modules/root/root_module.dart';
import 'package:flutter_entregas/src/modules/signup/signup_controller.dart';
import 'package:flutter_entregas/src/modules/signup/signup_page.dart';
import 'package:flutter_entregas/src/modules/signup/signup_repository.dart';
import 'package:flutter_entregas/src/modules/unknown/unknown_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //GLOBAL
        AsyncBind((i) => SharedPreferences.getInstance()),
        Bind.singleton((i) => Local()),

        //CLIENTE HTTP
        Bind.factory((i) => Dio()),
        Bind.factory<IWebClient>((i) => WebClientDio(i())),

        //LOGIN
        Bind.singleton((i) => LoginController(i())),
        Bind.singleton((i) => LoginRepository(i())),

        //SINGUP
        Bind.singleton((i) => SignupController(i())),
        Bind.singleton((i) => SignupRepository(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/login', child: (context, args) => const LoginPage(), transition: TransitionType.noTransition),
        ChildRoute('/signup', child: (context, args) => SignupPage(), transition: TransitionType.noTransition),
        ModuleRoute('/home', module: RootModule(), transition: TransitionType.noTransition),
        WildcardRoute(child: (contex, args) => const UnknownPage()),
      ];
}
