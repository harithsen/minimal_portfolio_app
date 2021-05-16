import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/data/projects_brain.dart';
import 'package:url_launcher/url_launcher.dart';

class Project extends StatelessWidget {
  final String image;
  final String label;
  final String disc;
  final List chipList;
  const Project({
    this.image,
    this.label,
    this.disc,
    this.chipList,
    Key key,
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
        ListView.builder(
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
                    style: Theme.of(context).textTheme.bodyText1,
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
                        padding: EdgeInsets.only(top: 8, bottom: 16),
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
                  padding: const EdgeInsets.only(top: 4, bottom: 10),
                  child: Divider(),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
