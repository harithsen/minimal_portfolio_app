import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/data/books_brain.dart';
import 'package:minimal_portfolio_webapp/widgets/nav_bar.dart';
import 'package:minimal_portfolio_webapp/widgets/page_header.dart';
import 'package:minimal_portfolio_webapp/widgets/url_launcher.dart';

class Books extends StatelessWidget {
  static const routeName = '/favbooks';

  Widget _booksBody() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: 700,
        child: ListView.builder(
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
                      child:
                          Image.asset(BooksBrain().booksBank[index].imagePath)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      BooksBrain().booksBank[index].heading,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline6,
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
                      label: Text(
                        "Buy Book",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 14, color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 60)
                ],
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavBar(),
            PageHeader(label: "Favourite Books"),
            _booksBody()
          ],
        ),
      ),
    );
  }
}
