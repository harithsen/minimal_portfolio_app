import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/about/about.dart';
import 'package:minimal_portfolio_webapp/screens/books/books.dart';
import 'package:minimal_portfolio_webapp/screens/home/home.dart';
import 'package:minimal_portfolio_webapp/screens/projects/projects.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                label: Text("Home"),
                icon: Image.asset(
                  'assets/emojis/house.png',
                  width: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/about');
                },
                label: Text("About Me"),
                icon: Image.asset(
                  'assets/emojis/about.png',
                  width: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/projects');
                },
                label: Text("Projects"),
                icon: Image.asset(
                  'assets/emojis/coding.png',
                  width: 16,
                ),
              ),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/books');
              },
              label: Text("Fav Books"),
              icon: Image.asset(
                'assets/emojis/book.png',
                width: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
