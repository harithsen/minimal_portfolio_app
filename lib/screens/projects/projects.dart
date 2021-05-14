import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/components/menu_bar.dart';
import 'package:minimal_portfolio_webapp/screens/components/sub_heading.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';
import 'package:minimal_portfolio_webapp/data/projects_brain.dart';

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.all(16),
          width: 600,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuBar(),
                SubHeading(label: "Projects"),
                Project(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
                        Chip(
                          backgroundColor: Colors.blue,
                          labelPadding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                          label: Text(
                            tool,
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        )
                    ],
                  ),
                ),
                Text(
                  ProjectsBrain().projectsBank[index].disc,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Image.asset('assets/images/appstore.png'),
                        onPressed: () {}),
                    IconButton(
                        icon: Image.asset('assets/images/playstore.png'),
                        onPressed: () {}),
                    IconButton(
                        icon: Image.asset('assets/images/www.png'),
                        onPressed: () {})
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 8),
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
