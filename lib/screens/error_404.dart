import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/widgets/nav_bar.dart';
import 'package:minimal_portfolio_webapp/widgets/page_header.dart';

class Error404 extends StatelessWidget {
  Widget _errorBody(context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: 700,
          child: Text(
            "Error",
            textAlign: TextAlign.left,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavBar(),
            //PageHeader(label: "About Me"),
            _errorBody(context)
          ],
        ),
      ),
    );
  }
}
