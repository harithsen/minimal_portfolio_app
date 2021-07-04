import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_portfolio_webapp/data/shots.dart';
import 'package:minimal_portfolio_webapp/screens/components/dark_mode_switch.dart';
import 'package:minimal_portfolio_webapp/screens/components/nav_bar.dart';
import 'package:minimal_portfolio_webapp/screens/components/theme_data.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';
import 'package:minimal_portfolio_webapp/services/dribbble_api.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/home_nav.dart';
import 'components/social_icons.dart';
import '../../data/shots.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    this.getData();
  }

  void getData() async {
    List<Shots> shots = [];
    shots = await DribbbleApi.instance.fetchData();
    print(shots[0].id);
    setState(() {
      dribbbleData = shots;
    });
  }

  isFeedEmpty() {
    return dribbbleData.isEmpty;
  }

  showImages() {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 600,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: dribbbleData.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: () {
              launchURL(dribbbleData[index].htmlUrl);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridTile(
                  child: CachedNetworkImage(
                    imageUrl: dribbbleData[index].images.hidpi,
                    placeholder: (context, url) => Center(
                      child: Container(
                          height: 5,
                          width: double.infinity,
                          child: LinearProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  footer: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.8, 1],
                          colors: [
                            Colors.transparent,
                            Colors.black87,
                            Colors.black,
                          ],
                        ),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        dribbbleData[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ))),
            ),
          );
        });
  }

  body() {
    return isFeedEmpty()
        ? Center(
            child: Container(
                width: 50, height: 50, child: CircularProgressIndicator()),
          )
        : showImages();
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
            //TopBar(),
            NavBar(),
            HomeHeader(),
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Image(
                      image: AssetImage("assets/emojis/dribbble.png"),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Image(
                      image: AssetImage("assets/emojis/medium.jpeg"),
                    ))
              ],
            ),
            SocialIcons(),
            SwitchDarkLightMode(themeProvider: themeProvider),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                "- Design -",
                style: GoogleFonts.rockSalt(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: 1200,
              child: body(),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

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
            radius: 60.0,
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
                'assets/emojis/hand_wave.png',
                scale: 1.8,
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
