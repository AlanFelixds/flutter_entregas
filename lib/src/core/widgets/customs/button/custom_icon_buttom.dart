import 'package:flutter/material.dart';

class CustomIconButtom extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const CustomIconButtom({Key? key, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        splashRadius: 20,
        splashColor: Colors.green,
      ),
    );
  }
}
