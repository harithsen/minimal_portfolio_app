import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/data/projects_brain.dart';
import 'package:minimal_portfolio_webapp/screens/components/menu_bar.dart';
import 'package:minimal_portfolio_webapp/screens/components/sub_heading.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/project_item.dart';

class Projects extends StatelessWidget {
  static const routeName = '/projects';

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
                SubHeading(label: "Projects"),
                Project(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
