import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/components/menu_bar.dart';
import 'package:minimal_portfolio_webapp/screens/components/sub_heading.dart';
import 'package:minimal_portfolio_webapp/screens/components/top_bar.dart';

import 'components/book_item.dart';

class Books extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.only(bottom: 30),
          width: 600,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuBar(),
                SubHeading(
                  label: "Favourite Books",
                ),
                BookItem(
                  imagePath: "assets/images/lean.jpg",
                  heading: "The Lean Startup by Eric Ries",
                  subheading:
                      "It's about continuously testing what you think your customers might want and adapting based on the results. Shows you ways to build companies through experimentation rather than assumptions.",
                  bookURL:
                      "https://www.amazon.com.au/Lean-Startup-Innovation-Successful-Businesses/dp/0670921602/ref=asc_df_0670921602/?tag=googleshopdsk-22&linkCode=df0&hvadid=341744909748&hvpos=&hvnetw=g&hvrand=17172362002601590074&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9071864&hvtargid=pla-364195445884&psc=1",
                ),
                BookItem(
                  imagePath: "assets/images/peter.jpg",
                  heading: "Zero to One by Peter Thiel",
                  subheading:
                      "Notes on start ups and how to build the future through the eyes of Peter Thiel",
                  bookURL:
                      "https://www.amazon.com.au/Zero-One-Blake-Masters/dp/0753555204/ref=asc_df_0753555204/?tag=googleshopdsk-22&linkCode=df0&hvadid=341744909748&hvpos=&hvnetw=g&hvrand=16816700077260753219&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9071864&hvtargid=pla-524041164953&psc=1",
                ),
                BookItem(
                    imagePath: "assets/images/elon.jpg",
                    heading:
                        "Elon Musk: How the Billionaire CEO of SpaceX and Tesla is Shaping our Future by Ashlee Vance",
                    subheading:
                        "Book talks about Elon Musk's life from his childhood up to the time he spent at Zip2 and PayPal, and then onto SpaceX, Tesla, and SolarCity.",
                    bookURL:
                        "https://www.amazon.com.au/Elon-Musk-Ashlee-Vance/dp/0753555646/ref=asc_df_0753555646/?tag=googleshopdsk-22&linkCode=df0&hvadid=341792459411&hvpos=&hvnetw=g&hvrand=13131495030383389514&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9071864&hvtargid=pla-524631536049&psc=1"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
