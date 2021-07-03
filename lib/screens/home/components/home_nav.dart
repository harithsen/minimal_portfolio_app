import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/about/about.dart';
import 'package:minimal_portfolio_webapp/screens/blog/blog.dart';
import 'package:minimal_portfolio_webapp/screens/books/books.dart';
import 'package:minimal_portfolio_webapp/screens/projects/projects.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            onPressed: () {
              Navigator.pushNamed(context, AboutMe.routeName);
            },
            label: Text("About Me"),
            icon: Image.asset(
              'assets/emojis/about.png',
              width: 16,
            ),
          ),
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: () {
            Navigator.pushNamed(context, Books.routeName);
          },
          label: Text("Fav Books"),
          icon: Image.asset(
            'assets/emojis/book.png',
            width: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            onPressed: () {
              Navigator.pushNamed(context, Projects.routeName);
            },
            label: Text("Projects"),
            icon: Image.asset(
              'assets/emojis/rocket.png',
              width: 16,
            ),
          ),
        )
      ],
    );
  }
}
