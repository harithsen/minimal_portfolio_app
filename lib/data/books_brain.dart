import 'package:minimal_portfolio_webapp/models/books_obj.dart';

class BooksBrain {
  List<Book> booksBank = [
    Book(
        heading: "The Design of Everyday Things by Don Norman",
        disc:
            "The psychology and principles behind the design of everyday objects around us.",
        imagePath: 'assets/images/design_of_everyday_things.jpg',
        // keytakeaway:
        //     "1. If you can't figure out how to operate a device/application, it's not your fault, it's the result of poor design.\n\n2. ",
        keytakeaway: "",
        buyURL:
            "https://www.amazon.com.au/Design-Everyday-Things-Revised-Expanded/dp/0465050654"),
    Book(
        heading: "The Lean Startup by Eric Ries",
        disc:
            "It's about continuously testing what you think your customers might want and adapting based on the results. Shows you ways to build companies through experimentation rather than assumptions.",
        imagePath: 'assets/images/lean.jpg',
        keytakeaway: "",
        buyURL:
            "https://www.amazon.com.au/Lean-Startup-Innovation-Successful-Businesses/dp/0670921602/ref=asc_df_0670921602/?tag=googleshopdsk-22&linkCode=df0&hvadid=341744909748&hvpos=&hvnetw=g&hvrand=17172362002601590074&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9071864&hvtargid=pla-364195445884&psc=1"),
    Book(
      heading: "Zero to One by Peter Thiel",
      disc:
          "Notes on start ups and how to build the future through the eyes of Peter Thiel.",
      imagePath: "assets/images/peter.jpg",
      keytakeaway: "",
      buyURL:
          "https://www.amazon.com.au/Zero-One-Blake-Masters/dp/0753555204/ref=asc_df_0753555204/?tag=googleshopdsk-22&linkCode=df0&hvadid=341744909748&hvpos=&hvnetw=g&hvrand=16816700077260753219&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9071864&hvtargid=pla-524041164953&psc=1",
    ),
    Book(
        heading:
            "Elon Musk: How the Billionaire CEO of SpaceX and Tesla is Shaping our Future by Ashlee Vance",
        disc:
            "Book talks about Elon Musk's life from his childhood up to the time he spent at Zip2 and PayPal, and then onto SpaceX, Tesla, and SolarCity.",
        imagePath: 'assets/images/elon.jpg',
        keytakeaway: "",
        buyURL:
            "https://www.amazon.com.au/Elon-Musk-Ashlee-Vance/dp/0753555646/ref=asc_df_0753555646/?tag=googleshopdsk-22&linkCode=df0&hvadid=341792459411&hvpos=&hvnetw=g&hvrand=13131495030383389514&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9071864&hvtargid=pla-524631536049&psc=1"),
    Book(
        heading: "The 12 Week Year by Brian P. Moran",
        disc:
            "Explains how to leverage the power of a 12 week year to drive improved results in any area of your life.",
        imagePath: 'assets/images/12week.jpg',
        keytakeaway: "",
        buyURL:
            "https://www.amazon.com.au/12-Week-Year-Others-Months/dp/1118509234"),
  ];
}
