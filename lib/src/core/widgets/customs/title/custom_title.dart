import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final Color? color;
  const CustomTitle({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: color ?? Colors.white,
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
