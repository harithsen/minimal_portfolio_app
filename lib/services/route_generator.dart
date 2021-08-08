import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/screens_export.dart';
import 'package:minimal_portfolio_webapp/widgets/nav_bar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/design':
        return MaterialPageRoute(
          builder: (_) => Design(),
        );
      case '/favbooks':
        return MaterialPageRoute(
          builder: (_) => Books(),
        );
      case '/aboutme':
        return MaterialPageRoute(
          builder: (_) => AboutMe(),
        );
      case '/projects':
        return MaterialPageRoute(
          builder: (_) => Projects(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavBar(),
              //PageHeader(label: "About Me"),
              const SizedBox(height: 100),
              Image(
                image: AssetImage(
                  "assets/emojis/error.png",
                ),
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text("Page Not Found",
                    style: const TextStyle(color: Colors.orange, fontSize: 24)),
              )
            ],
          ),
        ),
      );
    });
  }
}
