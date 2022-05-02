import 'package:flutter/material.dart';

class DialogMessage {
  static SnackBar errorMessage({required String message}) {
    return SnackBar(
      content: Text(message),
      elevation: 3,
      backgroundColor: Colors.red[300],
      duration: const Duration(seconds: 1),
    );
  }
}
