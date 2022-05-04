import 'package:flutter_entregas/src/app_module.dart';
import 'package:flutter_entregas/src/core/widgets/custom_button.dart';
import 'package:flutter_entregas/src/core/widgets/custom_text_form_field_rectangular.dart';
import 'package:flutter_entregas/src/core/widgets/custom_title.dart';
import 'package:flutter_entregas/src/core/widgets/dialogs/dialog_message.dart';
import 'package:flutter_entregas/src/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    final sizeWidget = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: sizeWidget > 600 ? uiDesktop(context) : uiMobile(),
    );
  }

  Widget uiDesktop(BuildContext context) {
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
                      onPressed: () async {
                        await controller.login() ? null : ScaffoldMessenger.of(context).showSnackBar(DialogMessage.errorMessage(message: controller.msg.value));
                      },
                      text: "Entrar"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não possui uma conta ? "),
                  TextButton(
                    onPressed: () => controller.goSignup(),
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                  ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(
              child: Divider(
                color: Colors.white,
                indent: 20,
                endIndent: 10,
                thickness: 1,
              ),
            ),
            CustomTitle(text: 'Login'),
            Expanded(
              child: Divider(
                color: Colors.white,
                indent: 10,
                endIndent: 20,
                thickness: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          width: 350,
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não possui uma conta ? "),
                  TextButton(
                      onPressed: () => controller.goSignup(),
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
