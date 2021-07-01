import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_portfolio_webapp/data/shots.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';
import 'package:minimal_portfolio_webapp/services/dribbble_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/home_nav.dart';
import 'components/social_icons.dart';
import '../../data/shots.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rive/rive.dart' as rive;

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

  // Column(
  //             children: [
  //               Text(dribbbleData[index].title),
  //               Container(
  //                   decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(10),
  //                 image: DecorationImage(
  //                     image: NetworkImage(dribbbleData[index].images.hidpi),
  //                     fit: BoxFit.cover),
  //               )),
  //               ListTile(
  //                 hoverColor: Colors.transparent,
  //                 title: Text(dribbbleData[index].title),
  //                 subtitle: Text(
  //                     DateFormat.yMd().format(dribbbleData[index].publishedAt)),
  //                 trailing: Icon(Icons.arrow_forward_outlined),
  //               )
  //             ],
  //           )

  body() {
    return isFeedEmpty()
        ? Center(
            child: Container(
                width: 50, height: 50, child: CircularProgressIndicator()),
          )
        : showImages();
  }
//
  // Container(
  //   height: 400,
  //   width: 400,
  //   child: rive.RiveAnimation.asset(
  //     'animations/poison_loader.riv',
  //   )),

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SliverAppBar(),
            TopBar(),
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
                textAlign: TextAlign.center,
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
