import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? icon;
  final TextEditingController textController;
  final String? hint;
  final String? label;

  const CustomTextFormField({
    Key? key,
    required this.textController,
    this.icon,
    this.hint,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 300,
        height: 40,
        child: TextFormField(
          controller: textController,
          decoration: InputDecoration(
            hintText: hint,
            label: Text(label ?? ''),
            contentPadding: const EdgeInsets.all(10.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Color(0xFF295cc5),
                width: 1,
              ),
            ),
            hoverColor: Colors.transparent,
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.red,
            suffixIcon: icon,
          ),
        ),
      ),
    );
  }
}
