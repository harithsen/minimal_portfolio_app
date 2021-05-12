import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String name;
  final String iconPath;
  final Function navPath;
  const MenuItem({
    this.name,
    this.iconPath,
    this.navPath,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        onPressed: navPath,
        label: Text(name),
        icon: Image.asset(
          iconPath,
          width: 16,
        ),
      ),
    );
  }
}
