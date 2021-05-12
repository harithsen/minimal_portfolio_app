import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/components/menu_bar.dart';
import 'package:minimal_portfolio_webapp/screens/components/sub_heading.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';

class Books extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.all(16),
          width: 600,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuBar(),
                SubHeading(
                  label: "Favourite Books",
                ),
                Text(
                  "The Lean Startup - Eric Ries",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "Most new businesses fail. But most of those failures are preventable.",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
