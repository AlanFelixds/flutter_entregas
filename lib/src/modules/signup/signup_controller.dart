import 'package:flutter/material.dart';
import 'package:flutter_entregas/src/core/models/user_model.dart';
import 'package:flutter_entregas/src/modules/signup/signup_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignupController {
  SignupRepository signupRepository;
  SignupController(this.signupRepository);

  final TextEditingController registerUsernameController =
      TextEditingController();
  final TextEditingController registerSignupPasswordController =
      TextEditingController();

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

  Future<void> createUser() async {
    UserModel user = UserModel();
    user.username = registerUsernameController.text;
    user.password = registerSignupPasswordController.text;

    await signupRepository.register(
      registerUsernameController.text,
      registerSignupPasswordController.text,
    );
  }

  goLogin() {
    Modular.to.pushNamed('/login');
  }
}
