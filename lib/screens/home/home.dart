import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_portfolio_webapp/data/shots.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';
import 'package:minimal_portfolio_webapp/screens/blog/blog.dart';
import 'package:minimal_portfolio_webapp/services/dribbble_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/home_nav.dart';
import 'components/social_icons.dart';
import '../../data/shots.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Shots> dribbbleData = <Shots>[];
  Shots newshot;
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

    print(dribbbleData[0].images.hidpi);
    // print(dribbbleData[0].id);
  }

  isFeedEmpty() {
    return dribbbleData.isEmpty;
  }

  double opacityLevel = 1.0;

  void changeOpacity() {}

  showImages() {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: dribbbleData.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onHover: (e) {
              setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
            },
            onTap: () {
              launchURL(dribbbleData[index].htmlUrl);
            },
            child: AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 3),
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(dribbbleData[index].images.hidpi),
                    fit: BoxFit.cover),
              )),
            ),
          );
        });
  }

  body() {
    return isFeedEmpty()
        ? Center(
            child: Container(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Colors.blue,
                )),
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
    //print(dribbbleData[0].id);
    return Scaffold(
      appBar: TopBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 50.0,
                child: ClipOval(
                    child: Image.asset('assets/images/profile_pic.jpg')),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 3,
                width: 50,
                color: Colors.blue,
              ),
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
            HomeNav(),
            SocialIcons(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                "Design",
                style: GoogleFonts.pacifico(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: 900,
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
