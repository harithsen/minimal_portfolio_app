import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String label;
  const PageHeader({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(bottom: 32),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: Colors.white, fontSize: 32),
      ),
      alignment: Alignment.center,
      color: Colors.orange,
    );
  }
}
