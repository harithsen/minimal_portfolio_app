import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/components/menu_bar.dart';
import 'package:minimal_portfolio_webapp/screens/components/sub_heading.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';
import 'components/book_item.dart';

class Books extends StatelessWidget {
  static const routeName = '/favbooks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: 600,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                MenuBar(),
                SubHeading(
                  label: "Favourite Books",
                ),
                BookItems(),
                SizedBox(height: 16)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
