import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/data/blog_brain.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';

class BlogArticle extends StatelessWidget {
  final String name;
  static const routeName = '/blog';

  const BlogArticle({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//final args = ModalRoute.of(context)!.settings.arguments as BlogBrain;
    return Scaffold(
      appBar: TopBar(),
      body: Container(
          margin: EdgeInsets.all(16),
          width: 600,
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   args.blogBank[0].title,
              //   style: Theme.of(context)
              //       .textTheme
              //       .headline6
              //       .copyWith(fontSize: 18),
              // ),
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
                        //Navigator.pushNamed(context, feedRoute, arguments: );
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
          )),
    );
  }
}
