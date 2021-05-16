import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/data/books_brain.dart';
import 'package:url_launcher/url_launcher.dart';

class BookItems extends StatelessWidget {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: BooksBrain().booksBank.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 4),
                  width: 80,
                  child: Image.asset(BooksBrain().booksBank[index].imagePath)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  BooksBrain().booksBank[index].heading,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Text(
                BooksBrain().booksBank[index].disc,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              TextButton.icon(
                onPressed: () =>
                    launchURL(BooksBrain().booksBank[index].buyURL),
                icon: Icon(Icons.arrow_right),
                label: Text("Buy Book"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 8),
                child: Divider(),
              ),
            ],
          );
        });
  }
}
