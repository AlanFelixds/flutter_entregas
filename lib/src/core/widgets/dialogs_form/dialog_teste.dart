import 'package:flutter/material.dart';

class NewDialog extends StatelessWidget {
  const NewDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey,
      elevation: 3,
      child: Container(
        width: 240,
        height: 300,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(),
              TextFormField(),
              TextFormField(),
              ElevatedButton(
                onPressed: () {},
                child: const Text("add participante"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
