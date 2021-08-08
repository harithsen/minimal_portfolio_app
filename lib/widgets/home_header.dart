import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 80.0,
            child:
                ClipOval(child: Image.asset('assets/images/profile_pic.jpg')),
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
                'assets/emojis/hand.gif',
                width: 60,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "I'm Harith Wickramasingha",
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8.0),
          height: 3,
          width: 50,
          color: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Developer, Designer & Entrepreneur",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
