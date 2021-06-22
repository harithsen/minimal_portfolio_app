import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/components/menu_bar.dart';
import 'package:minimal_portfolio_webapp/screens/components/sub_heading.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class Blog extends StatefulWidget {
  static const routeName = "/blog";

  //
  Blog() : super();

  final String title = 'RSS Feed Demo';

  @override
  BlogState createState() => BlogState();
}

class BlogState extends State<Blog> {
  static const String FEED_URL = 'https://medium.com/feed/@harithwick';
  RssFeed _feed;
  String _title;
  static const String loadingFeedMsg = 'Loading Feed...';
  static const String feedLoadErrorMsg = 'Error Loading Feed.';
  static const String feedOpenErrorMsg = 'Error Opening Feed.';
  static const String placeholderImg = 'images/no_image.png';
  GlobalKey<RefreshIndicatorState> _refreshKey;

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
      return;
    }
    updateTitle(feedOpenErrorMsg);
  }

  load() async {
    updateTitle(loadingFeedMsg);
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        updateTitle(feedLoadErrorMsg);
        return;
      }
      //print(result.items[0].media.title);
      updateFeed(result);
      updateTitle(_feed.title);
    });
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(Uri.parse(FEED_URL));
      return RssFeed.parse(response.body);
    } catch (e) {
      //
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);
    load();
  }

  list() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 30,
      ),
      shrinkWrap: true,
      itemCount: _feed.items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed.items[index];
        return InkWell(
          onTap: () => openFeed(item.link),
          child: Column(
            children: [
              CachedNetworkImage(
                height: 300,
                width: 600,
                fit: BoxFit.cover,
                imageUrl: item.content.value
                    .split("src=")[1]
                    .split(" ")[0]
                    .replaceAll('"', ""),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              ListTile(
                hoverColor: Colors.transparent,
                title: Text(
                  item.title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                subtitle: Text(DateFormat('yMMMMd').format(item.pubDate)),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 30.0,
                ),
                contentPadding: EdgeInsets.all(5.0),
                onTap: () => openFeed(item.link),
              ),
            ],
          ),
        );
      },
    );
  }

  isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }

  body() {
    return isFeedEmpty()
        ? Center(
            child: Container(
                width: 50, height: 50, child: CircularProgressIndicator()),
          )
        : RefreshIndicator(
            key: _refreshKey,
            child: list(),
            onRefresh: () => load(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: 600,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                MenuBar(),
                SubHeading(
                  label: "Blog Articles",
                ),
                body(),
                SizedBox(height: 16)
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
