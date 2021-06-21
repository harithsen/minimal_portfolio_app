import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/data/books_brain.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expandable/expandable.dart';

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
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: BooksBrain().booksBank.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  width: 80,
                  child: Image.asset(BooksBrain().booksBank[index].imagePath)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  BooksBrain().booksBank[index].heading,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.blue),
                ),
              ),
              Text(
                BooksBrain().booksBank[index].disc,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              BooksBrain().booksBank[index].keytakeaway.length > 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ExpansionTile(
                        childrenPadding: EdgeInsets.all(8),
                        title: Text("Key Takeaway",
                            style: Theme.of(context).textTheme.bodyText1),
                        expandedAlignment: Alignment.centerLeft,
                        children: [
                          Text(BooksBrain().booksBank[index].keytakeaway),
                        ],
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                child: TextButton.icon(
                  onPressed: () =>
                      launchURL(BooksBrain().booksBank[index].buyURL),
                  icon: Icon(Icons.arrow_right),
                  label: Text("Buy Book"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 30),
                child: Divider(),
              ),
            ],
          );
        });
  }
}
