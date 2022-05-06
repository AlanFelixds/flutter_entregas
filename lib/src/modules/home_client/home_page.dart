import 'package:flutter_entregas/src/core/widgets/custom_button.dart';
import 'package:flutter_entregas/src/core/widgets/custom_text_form_field_rectangular.dart';
import 'package:flutter_entregas/src/core/widgets/dialogs_form/dialog_teste.dart';
import 'package:flutter_entregas/src/modules/home_client/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  RxString nome = "".obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
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
                      color: Colors.green[200],
                      child: Obx(() {
                        return ListView.builder(
                          itemCount: controller.deliveries.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Material(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                                elevation: 3,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return NewDialog();
                                      },
                                    );
                                  },
                                  child: Text("${controller.deliveries[index]['item_name']}"),
                                ),
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
