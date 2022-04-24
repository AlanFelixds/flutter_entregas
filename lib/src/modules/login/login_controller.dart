import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/app_module.dart';
import 'package:flutter_entregas/src/core/local_storage/shared_preferences.dart';
import 'package:flutter_entregas/src/core/models/user_model.dart';
import 'package:flutter_entregas/src/modules/login/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginController {
  LoginRepository loginRepository;
  LoginController(this.loginRepository);

  final TextEditingController loginUsernameController = TextEditingController(text: "alan");
  final TextEditingController loginPasswordController = TextEditingController(text: "alan");

  final TextEditingController registerUsernameController = TextEditingController();
  final TextEditingController registerLoginPasswordController = TextEditingController();

  String msg = '';

  // Future<void> login() async {
  //   if (emailController.text == 'a' && passwordController.text == 'a') {
  //     Get.snackbar(
  //       'Login',
  //       "Login success",
  //       backgroundColor: Colors.green,
  //       duration: const Duration(seconds: 3),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     msg = 'login efetuado';
  //   } else {
  //     Get.snackbar(
  //       'Login',
  //       "Login fail",
  //       backgroundColor: Colors.red,
  //       duration: const Duration(seconds: 3),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  //   msg = 'usuário não encontrado';
  // }

  Future<void> login() async {
    UserModel usuario = UserModel();
    usuario.username = loginUsernameController.text;
    usuario.password = loginPasswordController.text;

    String result = await loginRepository.login(
      loginUsernameController.text,
      loginPasswordController.text,
    );

    await Modular.isModuleReady<AppModule>();

    LocalStorage localStorage = await Modular.getAsync<LocalStorage>();

    localStorage.save(chave: 'token', valor: result);

    goHome();
  }

  Future<void> createUser() async {
    UserModel user = UserModel();
    user.username = registerUsernameController.text;
    user.password = registerLoginPasswordController.text;

    await loginRepository.register(
      registerUsernameController.text,
      registerLoginPasswordController.text,
    );
  }

  goHome() {
    Modular.to.pushNamed('/home/delivery');
  }
}
