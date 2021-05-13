import 'package:flutter/material.dart';

import 'menu_item.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuItem(
                name: "Home",
                iconPath: 'assets/emojis/house.png',
                navPath: () {
                  Navigator.pop(context);
                },
              ),
              MenuItem(
                name: "About Me",
                iconPath: 'assets/emojis/about.png',
                navPath: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/about');
                },
              ),
              MenuItem(
                name: "Projects",
                iconPath: 'assets/emojis/rocket.png',
                navPath: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/projects');
                },
              ),
              MenuItem(
                name: "Fav Books",
                iconPath: 'assets/emojis/book.png',
                navPath: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/books');
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
