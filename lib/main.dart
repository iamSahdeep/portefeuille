import 'package:flutter/material.dart';
import 'package:portefeuille/webgl_animation.dart';
import 'package:provider/provider.dart';
import 'package:portefeuille/CORE/Helpers/RouteConfiguration.dart';
import 'package:portefeuille/CORE/ProviderModels/CursorProvider.dart';
import 'package:portefeuille/CORE/ProviderModels/ProjectProvider.dart';
import 'package:portefeuille/UI/Screens/HomePage.dart';
import 'package:portefeuille/UI/Screens/PageNotFound.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  WGLAnimation.instance.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CursorProvider>(create: (_) => CursorProvider()),
        ChangeNotifierProvider<ProjectProvider>(
            create: (_) => ProjectProvider()),
      ],
      child: MaterialApp(
        title: 'Sahdeep Singh',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'sharpgro',
            scaffoldBackgroundColor: Color(0xff2c2a2a),
            brightness: Brightness.dark),
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
        initialRoute: HomePage.Route,
        onUnknownRoute: (settings) {
          return CustomPageRoute(
              builder: (_) => PageNotFound(),
              settings: RouteSettings(name: PageNotFound.Route));
        },
      ),
    );
  }
}
