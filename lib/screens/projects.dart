import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/data/projects_brain.dart';
import 'package:minimal_portfolio_webapp/widgets/nav_bar.dart';
import 'package:minimal_portfolio_webapp/widgets/page_header.dart';
import 'package:minimal_portfolio_webapp/widgets/url_launcher.dart';

class Projects extends StatelessWidget {
  static const routeName = '/projects';

  Widget _projectsBody() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: 700,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: ProjectsBrain().projectsBank.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  child: ClipOval(
                      child: Image.asset(
                          ProjectsBrain().projectsBank[index].imagePath)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    ProjectsBrain().projectsBank[index].heading,
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var tool
                          in ProjectsBrain().projectsBank[index].tools)
                        Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Chip(
                              backgroundColor: tool[1],
                              labelPadding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 0),
                              label: Text(
                                tool[0],
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ))
                    ],
                  ),
                ),
                Text(
                  ProjectsBrain().projectsBank[index].disc,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Row(
                  children: [
                    ProjectsBrain().projectsBank[index].appStore != null
                        ? IconButton(
                            icon: Image.asset('assets/images/appstore.png'),
                            onPressed: () {
                              launchURL(
                                  ProjectsBrain().projectsBank[index].appStore);
                            })
                        : Container(),
                    ProjectsBrain().projectsBank[index].playStore != null
                        ? IconButton(
                            icon: Image.asset('assets/images/playstore.png'),
                            onPressed: () {
                              launchURL(ProjectsBrain()
                                  .projectsBank[index]
                                  .playStore);
                            })
                        : Container(),
                    ProjectsBrain().projectsBank[index].website != null
                        ? IconButton(
                            icon: Image.asset('assets/images/www.png'),
                            onPressed: () {
                              launchURL(
                                  ProjectsBrain().projectsBank[index].website);
                            })
                        : Container(),
                  ],
                ),
                ProjectsBrain().projectsBank[index].comingSoon
                    ? Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Chip(
                          backgroundColor: Colors.grey,
                          labelPadding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                          label: Text(
                            "Coming Soon",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ))
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Divider(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [NavBar(), PageHeader(label: "Projects"), _projectsBody()],
        ),
      ),
    );
  }
}
