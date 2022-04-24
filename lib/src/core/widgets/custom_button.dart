import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final double? height;
  const CustomButton({Key? key, required this.onPressed, required this.text, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: height ?? 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
