import 'dart:js' as js;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahdeepsinghflutter/CORE/Utils.dart';
import 'package:sahdeepsinghflutter/UI/Others/CustomDrawer.dart';
import 'package:sahdeepsinghflutter/UI/Others/HoverableButton.dart';

class BlogsPage extends StatelessWidget {
  static const String Route = "/blogs";

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: globalKey,
      endDrawer: CustomDrawer(),
      backgroundColor: Color(0xff262626),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.github,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: HoverableButton(
                width: 70,
                height: 70,
                onPressed: () {
                  globalKey.currentState.openEndDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "I don't do blogging very much but here are some on Dev.to",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Utils.getHeight(context) / 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white,
                    iconSize: 50,
                    onPressed: () {
                      js.context.callMethod(
                          "open", ["https://www.dev.to/iamsahdeep"]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
