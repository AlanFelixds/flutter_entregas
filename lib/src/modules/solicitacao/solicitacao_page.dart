import 'package:flutter_entregas/src/core/widgets/custom_button.dart';
import 'package:flutter_entregas/src/core/widgets/custom_text_form_field_rectangular.dart';
import 'package:flutter_entregas/src/core/widgets/dialogs_form/dialog_add_participante.dart';
import 'package:flutter_entregas/src/core/widgets/icon_button/custom_icon_buttom.dart';
import 'package:flutter_entregas/src/modules/solicitacao/solicitacao_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SolicitacaoPage extends StatefulWidget {
  const SolicitacaoPage({Key? key}) : super(key: key);

  @override
  State<SolicitacaoPage> createState() => _SolicitacaoPageState();
}

class _SolicitacaoPageState extends State<SolicitacaoPage> {
  final controller = Modular.get<SolicitacaoController>();
  RxString nome = "".obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.buscarDeliveries();
    });
    // Future.delayed(const Duration(seconds: 3)).then((value) {});
    // controller.buscarDeliveries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF636Ec5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .65,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                                onPressed: () async {
                                  await controller.createDelivery();
                                  await controller.buscarDeliveries();
                                },
                                height: 25,
                                text: "New Delivery",
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 300,
                      height: 200,
                      color: Colors.white,
                      child: Obx(() {
                        return ListView.builder(
                          itemCount: controller.deliveries.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              hoverColor: Colors.grey,
                              title: Text(
                                "${controller.deliveries[index]['item_name']}".capitalizeFirst ?? "",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomIconButtom(
                                    icon: const Icon(Icons.person_add_alt_rounded),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return DialogAddParticipante(controller: controller.nomeParticipanteController);
                                        },
                                      );
                                    },
                                  ),
                                  CustomIconButtom(
                                    icon: const Icon(Icons.delete_forever_rounded),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
