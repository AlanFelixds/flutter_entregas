import 'package:flutter_entregas/src/core/widgets/custom_button.dart';
import 'package:flutter_entregas/src/core/widgets/custom_text_form_field_rectangular.dart';
import 'package:flutter_entregas/src/core/widgets/custom_title.dart';
import 'package:flutter_entregas/src/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    final sizeWidget = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: sizeWidget > 600 ? uiDesktop() : uiMobile(),
    );
  }

  Widget uiDesktop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Expanded(child: Divider(color: Colors.white, indent: 200, endIndent: 20, height: 3)),
            CustomTitle(text: 'Login'),
            Expanded(child: Divider(color: Colors.white, indent: 20, endIndent: 200, height: 3)),
          ],
        ),
        const SizedBox(height: 30),
        Container(
          width: 500,
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text("Username", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormFieldRectangular(controller: controller.loginUsernameController, hintText: "Username"),
              const SizedBox(height: 10),
              const Text("Password", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormFieldRectangular(controller: controller.loginPasswordController, hintText: "Password"),
              const SizedBox(height: 20),
              Row(
                children: [
                  CustomButton(
                      onPressed: () {
                        controller.login();
                      },
                      text: "Entrar"),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget uiMobile() {
    return Center(
      child: Container(
        width: 350,
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const CustomTitle(text: 'Login', color: Colors.grey),
            const SizedBox(height: 20),
            const Text("Username", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
            const SizedBox(height: 5),
            CustomTextFormFieldRectangular(controller: controller.loginUsernameController, hintText: "Username"),
            const SizedBox(height: 10),
            const Text("Password", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
            const SizedBox(height: 5),
            CustomTextFormFieldRectangular(controller: controller.loginPasswordController, hintText: "Password"),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomButton(
                  onPressed: () => controller.login(),
                  text: "Entrar",
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget uiCadastro(controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Expanded(child: Divider(color: Colors.white, indent: 200, endIndent: 20, height: 3)),
            CustomTitle(text: 'Cadastrar'),
            Expanded(child: Divider(color: Colors.white, indent: 20, endIndent: 200, height: 3)),
          ],
        ),
        const SizedBox(height: 30),
        Container(
          width: 500,
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text("Username", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormFieldRectangular(controller: controller.registerUsernameController, hintText: "Username"),
              const SizedBox(height: 10),
              const Text("Password", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormFieldRectangular(controller: controller.registerLoginPasswordController, hintText: "Password"),
              const SizedBox(height: 20),
              Row(
                children: [
                  CustomButton(
                      onPressed: () {
                        controller.createUser();
                      },
                      text: "Cadastrar"),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
