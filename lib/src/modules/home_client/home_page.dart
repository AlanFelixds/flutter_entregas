import 'package:flutter_entregas/src/core/widgets/custom_button.dart';
import 'package:flutter_entregas/src/core/widgets/custom_text_form_field_rectangular.dart';
import 'package:flutter_entregas/src/modules/home_client/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();

    return Scaffold(
      backgroundColor: const Color(0XFF636Ec5),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            height: 130,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text("Product name", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
                const SizedBox(height: 5),
                CustomTextFormFieldRectangular(controller: controller.itemNameController, hintText: "Product name"),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CustomButton(
                      onPressed: () => controller.createDelivery(),
                      height: 25,
                      text: "New Delivery",
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// TESTE DA DATA
// Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text("Data", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
//                               const SizedBox(height: 5),
//                               CustomTextFormFieldRectangular(controller: controller.tempoController, hintText: "Data"),
//                               const SizedBox(height: 20),
//                             ],
//                           ),
// Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Row(
//                                 children: [
//                                   CustomButton(
//                                     onPressed: () {
//                                       controller.calcularTempo();
//                                     },
//                                     height: 30,
//                                     text: "enviar data",
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Obx(
//                               () {
//                                 return Column(
//                                   children: [
//                                     const SizedBox(height: 10),
//                                     Text("${controller.primeiroDia}"),
//                                     const SizedBox(height: 10),
//                                     Text("${controller.ultimoDia}"),
//                                     const SizedBox(height: 10),
//                                   ],
//                                 );
//                               },
//                             ),