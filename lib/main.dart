import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahdeepsinghflutter/CORE/ProviderModels/CursorProvider.dart';
import 'package:sahdeepsinghflutter/CORE/ProviderModels/ProjectProvider.dart';
import 'package:sahdeepsinghflutter/UI/Screens/AboutPage.dart';
import 'package:sahdeepsinghflutter/UI/Screens/HomePage.dart';
import 'package:sahdeepsinghflutter/UI/Screens/PageNotFound.dart';
import 'package:sahdeepsinghflutter/UI/Screens/ProjectsPage.dart';

void main() {
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
        routes: <String, WidgetBuilder>{
          HomePage.Route: (context) => HomePage(),
          AboutPage.Route: (context) => AboutPage(),
          ProjectPage.Route: (context) => ProjectPage()
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
              builder: (_) => PageNotFound(),
              settings: RouteSettings(name: "404"));
        },
      ),
    );
  }
}
