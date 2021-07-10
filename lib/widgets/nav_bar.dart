import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:minimal_portfolio_webapp/screens/screens_export.dart';

double collapsableHeight = 0.0;

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        AnimatedContainer(
          margin: EdgeInsets.only(top: 79.0),
          duration: Duration(milliseconds: 375),
          curve: Curves.ease,
          height: (width < 800.0) ? collapsableHeight : 0.0,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: navBarItems,
              ),
            ),
          ),
        ),
        Container(
          height: 80.0,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: LayoutBuilder(builder: (context, constraints) {
            if (width < 800.0) {
              return NavBarButton(
                onPressed: () {
                  if (collapsableHeight == 0.0) {
                    setState(() {
                      collapsableHeight = 280.0;
                    });
                  } else if (collapsableHeight == 280.0) {
                    setState(() {
                      collapsableHeight = 0.0;
                    });
                  }
                },
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: navBarItems,
              );
            }
          }),
        ),
      ],
    );
  }
}

class NavBarButton extends StatefulWidget {
  final Function onPressed;

  NavBarButton({
    required this.onPressed,
  });

  @override
  _NavBarButtonState createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[50],
        ),
        child: IconButton(
            icon: Icon(
              Icons.menu,
              size: 25.0,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                widget.onPressed();
              });
            }),
      ),
    );
  }
}

List<Widget> navBarItems = [
  NavBarItem(
      text: 'Home',
      route: HomeScreen.routeName,
      image: 'assets/emojis/house.png'),
  NavBarItem(
      text: 'About Me',
      route: AboutMe.routeName,
      image: 'assets/emojis/about.png'),
  NavBarItem(
      text: 'Design',
      route: Design.routeName,
      image: 'assets/emojis/design.png'),
  NavBarItem(
      text: 'Projects',
      route: Projects.routeName,
      image: 'assets/emojis/rocket.png'),
  NavBarItem(
      text: 'Fav Books',
      route: Books.routeName,
      image: 'assets/emojis/book.png'),
];

class NavBarItem extends StatefulWidget {
  final String text;
  final String route;
  final String image;
  NavBarItem({
    required this.text,
    required this.route,
    required this.image,
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool hoover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          hoover = true;
        });
      },
      onExit: (value) {
        setState(() {
          hoover = false;
        });
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white60,
          onTap: () {
            Navigator.pushNamed(context, widget.route);
            setState(() {
              collapsableHeight = 0.0;
            });
          },
          child: Container(
            height: 60.0,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image(
                    image: AssetImage(
                      widget.image,
                    ),
                    width: 20,
                  ),
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: hoover
                        ? Colors.deepOrange
                        : Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
