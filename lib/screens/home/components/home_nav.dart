import 'package:flutter/material.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
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
                  Navigator.pushNamed(context, '/projects');
                },
                label: Text("Projects"),
                icon: Image.asset(
                  'assets/emojis/coding.png',
                  width: 16,
                ),
              ),
            )
          ],
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/books');
          },
          label: Text("Fav Books"),
          icon: Image.asset(
            'assets/emojis/book.png',
            width: 16,
          ),
        ),
      ],
    );
  }
}
