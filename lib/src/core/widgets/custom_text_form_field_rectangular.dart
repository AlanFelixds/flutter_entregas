import 'package:flutter/material.dart';

class CustomTextFormFieldRectangular extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? label;

  const CustomTextFormFieldRectangular(
      {Key? key, required this.controller, this.hintText, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            label: label,
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 12,
            )),
      ),
    );
  }
}
