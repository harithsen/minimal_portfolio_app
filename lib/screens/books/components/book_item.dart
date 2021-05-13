import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookItem extends StatelessWidget {
  final String imagePath;
  final String heading;
  final String subheading;
  final String bookURL;
  const BookItem({
    Key key,
    this.bookURL,
    this.imagePath,
    this.heading,
    this.subheading,
  }) : super(key: key);

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(top: 4),
            width: 80,
            child: Image.asset(imagePath)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            heading,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Text(
          subheading,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        TextButton.icon(
          onPressed: () => launchURL(bookURL),
          icon: Icon(Icons.arrow_right),
          label: Text("Buy Book"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 8),
          child: Divider(),
        ),
      ],
    );
  }
}
