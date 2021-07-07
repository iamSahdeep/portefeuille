import 'package:flutter/material.dart';
import 'package:portefeuille/CORE/Data/SiteData.dart';
import 'package:portefeuille/CORE/DataModels/Path.dart';
import 'package:portefeuille/UI/Screens/AboutPage.dart';
import 'package:portefeuille/UI/Screens/BlogsPage.dart';
import 'package:portefeuille/UI/Screens/ContactPage.dart';
import 'package:portefeuille/UI/Screens/HomePage.dart';
import 'package:portefeuille/UI/Screens/PageNotFound.dart';
import 'package:portefeuille/UI/Screens/ProjectDetailsPage.dart';
import 'package:portefeuille/UI/Screens/ProjectsPage.dart';

class RouteConfiguration {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  static List<Path> paths = [
    Path(
      r'^' + ProjectDetailsPage.Route + r'/([\w-]+)$',
      (context, match) => PersonalData.getProjectPage(match),
    ),
    Path(
      r'^' + ProjectPage.Route + '\$',
          (context, match) => ProjectPage(),
    ),
    Path(
      r'^' + ProjectPage.Route + '/\$',
      (context, match) => ProjectPage(),
    ),
    Path(
      r'^' + AboutPage.Route + '\$',
      (context, match) => AboutPage(),
    ),
    Path(
      r'^' + AboutPage.Route + '/\$',
          (context, match) => AboutPage(),
    ),
    Path(
      r'^' + BlogsPage.Route + '\$',
      (context, match) => BlogsPage(),
    ),
    Path(
      r'^' + BlogsPage.Route + '/\$',
          (context, match) => BlogsPage(),
    ),
    Path(
      r'^' + ContactPage.Route + '\$',
      (context, match) => ContactPage(),
    ),
    Path(
      r'^' + ContactPage.Route + '/\$',
          (context, match) => ContactPage(),
    ),
    Path(
      r'^' + PageNotFound.Route + '\$',
      (context, match) => PageNotFound(),
    ),
    Path(
      r'^' + PageNotFound.Route + '/\$',
          (context, match) => PageNotFound(),
    ),
  ];

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (settings.name == "/") {
      return CustomPageRoute(
        builder: (context) => HomePage(),
        settings: settings,
      );
    }
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return CustomPageRoute(
          builder: (context) {
            return path.builder(context, match);
          },
          settings: PersonalData.getProjectPage(match) is PageNotFound &&
                  path == paths.first
              ? RouteSettings(name: PageNotFound.Route)
              : settings,
        );
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return CustomPageRoute(
        builder: (_) => PageNotFound(),
        settings: RouteSettings(name: PageNotFound.Route));
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget Function(dynamic) builder;
  final RouteSettings settings;

  CustomPageRoute({this.builder, this.settings})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                builder.call(context),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.5,
                      end: 1.0,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                    child: child,
                  ),
                ),
            settings: settings);
}
