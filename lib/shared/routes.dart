import 'package:flutter/material.dart';
import 'package:news_app/features/home/view/home_page.dart';
import 'package:news_app/features/news_details/view/news_details.dart';
import 'package:news_app/features/settings/view/settings_view.dart';

class Routes {
  static const home = '/home';
  static const setting = '/settings';
  static const newsDetails = '/news_details';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          settings: settings,
          builder: ((context) => const HomePage()),
        );
      case newsDetails:
        return MaterialPageRoute(
          settings: settings,
          builder: ((context) => NewsDetails(
                args: settings.arguments as NewsDetailsArgs,
              )),
        );

      case setting:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SettingsView(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: ((context) => const HomePage()),
        );
    }
  }
}
