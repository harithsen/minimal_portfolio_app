import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/about/about.dart';
import 'package:minimal_portfolio_webapp/screens/books/books.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';
import 'package:minimal_portfolio_webapp/screens/projects/projects.dart';

import 'components/home_nav.dart';
import 'components/social_icons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 50.0,
                child: ClipOval(
                    child: Image.asset('assets/images/profile_pic.jpg')),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hey There!",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/emojis/hand_wave.png',
                    scale: 1.8,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "I'm Harith Wickramasingha",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 3,
                width: 50,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Developer, Designer & Entrepreneur",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            HomeNav(),
            SocialIcons(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
