import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/models/shots.dart';
import 'package:minimal_portfolio_webapp/widgets/dark_mode_switch.dart';
import 'package:minimal_portfolio_webapp/widgets/nav_bar.dart';
import 'package:minimal_portfolio_webapp/widgets/theme_data.dart';
import 'package:minimal_portfolio_webapp/widgets/url_launcher.dart';
import 'package:provider/provider.dart';
import '../models/shots.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Shots> dribbbleData = <Shots>[];
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  Widget _socialIcon(String imagePath, String link) {
    return Container(
      margin: EdgeInsets.all(8),
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
      required String url}) {
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

  Widget _webButtons() {
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
                url: "https://dribbble.com/harithwick"),
            _webButton(
                text1: "Medium",
                text2: "Articles",
                imagePath: "assets/emojis/medium.png",
                url: "https://harithwick.medium.com/"),
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
                url: "https://github.com/harithwick"),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            NavBar(),
            HomeHeader(),
            _webButtons(),
            _socialIcons(),
            SwitchDarkLightMode(themeProvider: themeProvider),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 80.0,
            child:
                ClipOval(child: Image.asset('assets/images/profile_pic.jpg')),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hey There!",
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                'assets/emojis/hand.gif',
                width: 60,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "I'm Harith Wickramasingha",
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8.0),
          height: 3,
          width: 50,
          color: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Developer, Designer & Entrepreneur",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
