import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/models/shots.dart';
import 'package:minimal_portfolio_webapp/services/dribbble_api.dart';
import 'package:minimal_portfolio_webapp/widgets/nav_bar.dart';
import 'package:minimal_portfolio_webapp/widgets/page_header.dart';
import 'package:minimal_portfolio_webapp/widgets/url_launcher.dart';
import 'package:shimmer/shimmer.dart';

class Design extends StatefulWidget {
  static const routeName = '/design';

  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
  List<Shots> dribbbleData = <Shots>[];
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    this._getData();
  }

  void _getData() async {
    List<Shots> shots = [];
    shots = await DribbbleApi().fetchData();
    print(shots[0].id);
    setState(() {
      dribbbleData = shots;
    });
  }

  _isFeedEmpty() {
    return dribbbleData.isEmpty;
  }

  _showImages() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: 1200,
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 510,
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
                          child: Shimmer.fromColors(
                            baseColor: Colors.orange,
                            highlightColor: Colors.black,
                            enabled: true,
                            child: Text(
                              'Loading...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))),
                ),
              );
            }),
      ),
    );
  }

  _body() {
    return _isFeedEmpty()
        ? Center(
            child: Container(
                width: 50, height: 50, child: CircularProgressIndicator()),
          )
        : _showImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [NavBar(), PageHeader(label: "Design"), _body()],
        ),
      ),
    );
  }
}
