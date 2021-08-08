import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/widgets/dark_mode_switch.dart';
import 'package:minimal_portfolio_webapp/widgets/home_header.dart';
import 'package:minimal_portfolio_webapp/widgets/nav_bar.dart';
import 'package:minimal_portfolio_webapp/widgets/theme_data.dart';
import 'package:minimal_portfolio_webapp/widgets/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  Widget _socialIcon(String imagePath, String link) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
          icon: Image.asset(
            imagePath,
          ),
          onPressed: () {
            launchURL(link);
          }),
    );
  }

  Widget _socialIcons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _socialIcon(
              'assets/emojis/twitter.png', "https://twitter.com/DevHarithWick"),
          _socialIcon('assets/emojis/linkedin.png',
              "https://www.linkedin.com/in/harithwick/"),
        ],
      ),
    );
  }

  Widget _webButton(
      {required String text1,
      required String text2,
      required String imagePath,
      required String url,
      required dynamic context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
          onPressed: () {
            launchURL(url);
          },
          child: Row(
            children: [
              Image(
                image: AssetImage(imagePath),
                width: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  text1 + "\n" + text2,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: 16),
                ),
              ),
            ],
          )),
    );
  }

  Widget _webButtons(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _webButton(
                text1: "Dribbble",
                text2: "Designs",
                imagePath: "assets/emojis/dribbble.png",
                url: "https://dribbble.com/harithwick",
                context: context),
            _webButton(
                text1: "Medium",
                text2: "Articles",
                imagePath: "assets/emojis/medium.png",
                url: "https://harithwick.medium.com/",
                context: context),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _webButton(
                text1: "Github",
                text2: "Projects",
                imagePath: "assets/emojis/github.png",
                url: "https://github.com/harithwick",
                context: context),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

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
              HomeHeader(),
              _webButtons(context),
              _socialIcons(),
              SwitchDarkLightMode(themeProvider: themeProvider),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
