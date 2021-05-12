import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/components/menu_bar.dart';
import 'package:minimal_portfolio_webapp/screens/components/sub_heading.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';

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
  final String chipList;
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
      children: [
        SizedBox(
          height: 8,
        ),
        CircleAvatar(
          radius: 50.0,
          child: ClipOval(child: Image.asset('assets/images/profile_pic.jpg')),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            "NAATI Sinhalese",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Chip(
                backgroundColor: Colors.deepOrange,
                labelPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                label: Text(
                  "Flutter",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
              Chip(
                label: Text("Flutter"),
              )
            ],
          ),
        ),
        Text(
          "An app that helps students excel at the NAATI Sinhalese interpretation exam by providing all study essentials in one location. Pass the NAATI CCL Sinhalese Exam on the first go.",
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Divider(),
      ],
    );
  }
}
