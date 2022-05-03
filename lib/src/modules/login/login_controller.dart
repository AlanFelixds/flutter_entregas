import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/app_module.dart';
import 'package:flutter_entregas/src/core/exception/login_exception.dart';
import 'package:flutter_entregas/src/core/local_storage/shared_preferences.dart';
import 'package:flutter_entregas/src/core/models/user_model.dart';
import 'package:flutter_entregas/src/modules/login/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/state_manager.dart';

class LoginController {
  LoginRepository loginRepository;
  LoginController(this.loginRepository);

  final TextEditingController loginUsernameController = TextEditingController(text: "alan");
  final TextEditingController loginPasswordController = TextEditingController(text: "alan");

  final TextEditingController registerUsernameController = TextEditingController();
  final TextEditingController registerLoginPasswordController = TextEditingController();

  final RxString msg = ''.obs;

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

  Future<bool> login() async {
    UserModel usuario = UserModel();
    usuario.username = loginUsernameController.text;
    usuario.password = loginPasswordController.text;

    try {
      String result = await loginRepository.login(
        loginUsernameController.text,
        loginPasswordController.text,
      );

      LocalStorage localStorage = Modular.get<LocalStorage>();
      localStorage.save(chave: 'token', valor: result);
      goHome();
      return true;
    } on LoginException catch (e) {
      msg.value = e.message;
      return false;
    }
  }

  goHome() => Modular.to.pushNamed('/home/delivery');

  goSignup() => Modular.to.pushNamed('/signup');
}
