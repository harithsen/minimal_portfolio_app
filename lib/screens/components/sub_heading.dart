import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  final String label;
  const SubHeading({
    this.label,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        label,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
