import 'package:flutter_entregas/src/core/widgets/custom_button.dart';
import 'package:flutter_entregas/src/core/widgets/custom_text_form_field_rectangular.dart';
import 'package:flutter_entregas/src/core/widgets/custom_title.dart';
import 'package:flutter_entregas/src/modules/signup/signup_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final controller = Modular.get<SignupController>();

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
            Expanded(
                child: Divider(
                    color: Colors.white,
                    indent: 200,
                    endIndent: 20,
                    height: 3)),
            CustomTitle(text: 'Signup'),
            Expanded(
                child: Divider(
                    color: Colors.white,
                    indent: 20,
                    endIndent: 200,
                    height: 3)),
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
              const Text("Username",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormFieldRectangular(
                  controller: controller.registerUsernameController,
                  hintText: "Username"),
              const SizedBox(height: 10),
              const Text("Password",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormFieldRectangular(
                  controller: controller.registerSignupPasswordController,
                  hintText: "Password"),
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
            CustomTitle(text: 'Signup'),
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
              const Text("Username",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormFieldRectangular(
                  controller: controller.registerUsernameController,
                  hintText: "Username"),
              const SizedBox(height: 10),
              const Text("Password",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormFieldRectangular(
                  controller: controller.registerSignupPasswordController,
                  hintText: "Password"),
              const SizedBox(height: 20),
              Row(
                children: [
                  CustomButton(
                    onPressed: () => controller.createUser(),
                    text: "Cadastrar",
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
}
