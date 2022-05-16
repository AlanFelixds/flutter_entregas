import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool? selected;
  final Widget trailing;

  const MenuListTile({
    Key? key,
    required this.title,
    required this.onTap,
    required this.trailing,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(title),
        selected: selected ?? false,
        selectedTileColor: Colors.green[100],
        selectedColor: Colors.white,
        hoverColor: Colors.green[800],
        trailing: trailing,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onTap: onTap,
      ),
    );
  }
}
