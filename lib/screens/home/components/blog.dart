import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/data/blog_brain.dart';
import 'package:minimal_portfolio_webapp/screens/home/components/blog_article.dart';

class Blog extends StatelessWidget {
  static const routeName = '/blog';
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        width: 600,
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Blog",
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 16,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: BlogBrain().blogBank.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, BlogArticle.routeName,
                          arguments: BlogBrain().blogBank[index].title);
                    },
                    title: Text(
                      BlogBrain().blogBank[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 18, color: Colors.blue),
                    ),
                    subtitle: Text(
                      BlogBrain().blogBank[index].date,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).textTheme.headline6.color,
                    ),
                  );
                })
          ],
        ));
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
