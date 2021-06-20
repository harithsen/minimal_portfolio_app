import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/components/menu_bar.dart';
import 'package:minimal_portfolio_webapp/screens/components/sub_heading.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';

class AboutMe extends StatelessWidget {
  static const routeName = '/about';

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
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuBar(),
                SubHeading(
                  label: "About Me",
                ),
                Text(
                  "Hey everyone, I'm Harith. I'm a self taught developer based in Sydney, Australia.\n\nHeres how I got in to software development. During my final year of Uni, we were celebrating a friends birthday at a bar, when one of the guys (Jay Anand) started talking about a new platform he came accross called Flutter for cross platform app development. This sounded like a game changer, a single code base for mobile, web and desktop application development!! No more isolated development teams, one codebase to rule them all. That night I started researching about Flutter and I immediately knew I had to start learning it right away. I called up Jay and said lets learn Flutter together.\n\nSo the journey began, on weekdays after work I would go to Jays house and together we started learning and building applications using Flutter in Jays garage (as cheesey as it may sound). Within a month, we built and released our first app, Quick Notes. Quick Notes was an extremly basic notes taking app but it gave us the confidence to push ourselves to build more complex projects in the months to come. It took us two years of learning and multiple failed projects to release an app that made us our first real money, \$15. That feeling was priceless.\n\nCurrently, I'm working on learning decentralised application development on the Ethereum blockchain. I see that blockchain has the potential to disrupt multiple industries and improve many lives specially in the developing nations. I'd love to be a part of this.\n\nMy goal for 2021 is to figure out the most efficient way for me to learn any new skill. I think this is THE skill to have regardless of the field you choose to pursue.\n\nI enjoy meeting new people, come say hello on Twitter!",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
