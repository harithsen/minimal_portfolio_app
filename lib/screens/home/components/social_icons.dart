import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
                icon: Image.asset(
                  'assets/emojis/twitter.png',
                ),
                onPressed: () {
                  launchURL("https://twitter.com/DevHarithWick");
                }),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
                icon: Image.asset(
                  'assets/emojis/linkedin.png',
                ),
                onPressed: () {
                  launchURL("https://www.linkedin.com/in/harithwick/");
                }),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
                icon: Image.asset(
                  'assets/emojis/gmail.png',
                ),
                onPressed: () {
                  launchURL("mailto:harithsen@gmail.com");
                }),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
                icon: Image.asset(
                  'assets/emojis/github.png',
                ),
                onPressed: () {
                  launchURL("https://github.com/harithsen");
                }),
          ),
        ],
      ),
    );
  }
}
