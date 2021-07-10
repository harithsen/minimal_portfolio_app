import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/widgets/nav_bar.dart';
import 'package:minimal_portfolio_webapp/widgets/page_header.dart';

class AboutMe extends StatelessWidget {
  static const routeName = '/aboutme';

  Widget _aboutBody(context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: 700,
          child: Text(
            "Hey everyone, I'm Harith. I'm a self taught developer based in Sydney, Australia.\n\nHere's how I got into software development. During my final year of Uni, we were celebrating a friends birthday at a bar, when one of the guys (Jay) started talking about a new platform he came across called Flutter for cross platform app development. This sounded like a game changer, a single code base for mobile, web and desktop application development!! No more isolated development teams, one codebase to rule them all. That night I started researching about Flutter and I immediately knew I had to start learning it right away. I called up Jay and said let's learn Flutter together.\n\nSo the journey began, on weekdays after work I would go to Jays house and together we started learning and building applications using Flutter in Jays garage (as cheesy as it may sound). Within a month, we built and released our first app, Quick Notes. Quick Notes was an extremely basic notes taking app but it gave us the confidence to push ourselves to build more complex projects in the months to come. It took us two years of learning and multiple failed projects to release an app that made us our first real money, \$15. That feeling was priceless.\n\nI love designing products from ground up. Design isn't just the physical appearance of a product. It's how the product makes you feel, how intuitive is it to use for the intended purpose, how you convey a message as a designer to a user and so much more. When I design a product, I get the opportunity to think and implement ideas and observe how users interact with the product. Seeing a stranger interact and be thrilled with a product you built is the most gratifying feeling in the world.\n\nMy goal for 2021 is to figure out the most efficient way for me to learn any new skill. I think this is THE skill to have regardless of the field you choose to pursue.\n\nI enjoy meeting new people, come say hello on Twitter!",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavBar(),
            PageHeader(label: "About Me"),
            _aboutBody(context)
          ],
        ),
      ),
    );
  }
}
