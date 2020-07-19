import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahdeepsinghflutter/CORE/ProviderModel.dart';
import 'package:sahdeepsinghflutter/UI/Screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UIModel>(create: (_) => UIModel()),
      ],
      child: MaterialApp(
        title: 'Sahdeep Singh',
        routes: <String, WidgetBuilder>{
          HomePage.Route: (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
