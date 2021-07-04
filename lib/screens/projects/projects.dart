import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/data/projects_brain.dart';
import 'package:minimal_portfolio_webapp/screens/components/menu_bar.dart';
import 'package:minimal_portfolio_webapp/screens/components/nav_bar.dart';
import 'package:minimal_portfolio_webapp/screens/components/sub_heading.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/project_item.dart';

class Projects extends StatelessWidget {
  static const routeName = '/projects';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavBar(),
            Container(
              width: double.infinity,
              height: 150,
              margin: EdgeInsets.only(bottom: 32),
              child: Text(
                "Projects",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white,
                    ),
              ),
              alignment: Alignment.center,
              color: Colors.orange,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: 600,
                child: Project(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
