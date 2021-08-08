import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: 700,
        child: AnimationLimiter(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: ProjectsBrain().projectsBank.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 750),
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              child: ClipOval(
                                  child: Image.asset(ProjectsBrain()
                                      .projectsBank[index]
                                      .imagePath)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text(
                                  ProjectsBrain().projectsBank[index].heading,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  for (var tool in ProjectsBrain()
                                      .projectsBank[index]
                                      .tools)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        tool[0],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: tool[1]),
                                      ),
                                    )
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
                                ProjectsBrain().projectsBank[index].appStore !=
                                        ""
                                    ? IconButton(
                                        icon: Image.asset(
                                            'assets/images/appstore.png'),
                                        onPressed: () {
                                          launchURL(ProjectsBrain()
                                              .projectsBank[index]
                                              .appStore);
                                        })
                                    : Container(),
                                ProjectsBrain().projectsBank[index].playStore !=
                                        ""
                                    ? IconButton(
                                        icon: Image.asset(
                                            'assets/images/playstore.png'),
                                        onPressed: () {
                                          launchURL(ProjectsBrain()
                                              .projectsBank[index]
                                              .playStore);
                                        })
                                    : Container(),
                                ProjectsBrain().projectsBank[index].website !=
                                        ""
                                    ? IconButton(
                                        icon: Image.asset(
                                            'assets/images/www.png'),
                                        onPressed: () {
                                          launchURL(ProjectsBrain()
                                              .projectsBank[index]
                                              .website);
                                        })
                                    : Container(),
                                ProjectsBrain().projectsBank[index].github != ""
                                    ? IconButton(
                                        icon: Image.asset(
                                            'assets/emojis/github.png'),
                                        onPressed: () {
                                          launchURL(ProjectsBrain()
                                              .projectsBank[index]
                                              .github);
                                        })
                                    : Container(),
                              ],
                            ),
                            ProjectsBrain().projectsBank[index].comingSoon
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Chip(
                                      backgroundColor: Colors.grey,
                                      label: Text(
                                        "Coming Soon",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ))
                                : Container(),
                            const SizedBox(height: 80)
                          ],
                        ),
                      )));
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              NavBar(),
              PageHeader(label: "Projects"),
              _projectsBody(),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    ));
  }
}
