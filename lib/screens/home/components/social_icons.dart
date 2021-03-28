import 'package:flutter/material.dart';

class SocialIcons extends StatelessWidget {
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
                  'emojis/twitter.png',
                ),
                onPressed: () {}),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
                icon: Image.asset(
                  'emojis/facebook.png',
                ),
                onPressed: () {}),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
                icon: Image.asset(
                  'emojis/linkedin.png',
                ),
                onPressed: () {}),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
                icon: Image.asset(
                  'emojis/gmail.png',
                ),
                onPressed: () {}),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
                icon: Image.asset(
                  'emojis/github.png',
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
