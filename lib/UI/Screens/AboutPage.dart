import 'dart:js' as js;

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sahdeepsinghflutter/CORE/ProviderModels/CursorProvider.dart';
import 'package:sahdeepsinghflutter/CORE/Utils.dart';
import 'package:sahdeepsinghflutter/UI/Others/DefaultCursor.dart';

class AboutPage extends StatelessWidget {
  static const String TAG = "AboutPage";
  static const String Route = "/about";

  @override
  Widget build(BuildContext context) {
    final uiModel = Provider.of<CursorProvider>(context);
    return Scaffold(
        body: MouseRegion(
          cursor: SystemMouseCursors.none,
          onHover: (event) {
            uiModel.setPointerPosition(event.position);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: Utils.getHeight(context),
            width: Utils.getWidth(context),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: uiModel.pointerPosition.dx - 100,
                  top: uiModel.pointerPosition.dy - 100,
                  child: DefaultCursor(
                    color: Colors.white,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 100),
                  left: uiModel.pointerPosition.dx,
                  top: uiModel.pointerPosition.dy,
                  child: Container(
                    color: Colors.white,
                    width: 3,
                    height: 3,
                  ),
                ),
                Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          AnimatedPadding(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(
                                vertical: Utils.isMobileView(context)
                                    ? 100
                                    : uiModel.pointerPosition.dy / 10),
                            child: SingleChildScrollView(
                              padding: EdgeInsets.only(top: 50),
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: EdgeInsets.only(
                                    left: Utils.isMobileView(context)
                                        ? 10
                                        : uiModel.pointerPosition.dx / 4),
                                child: Text(
                                  "About   About   About",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                      Utils.isMobileView(context) ? 60 : 150,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: !Utils.isMobileView(context)
                                ? EdgeInsets.only(
                                bottom: 100, left: 100, right: 100)
                                : EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontSize:
                                          Utils.isMobileView(context) ? 25 : 40,
                                          color: Colors.white,
                                          letterSpacing: 2,
                                          wordSpacing: 5),
                                      children: [
                                        TextSpan(
                                          text: "Hi there, my name is ",
                                        ),
                                        TextSpan(
                                            text: "Sahdeep Singh.\n\n",
                                            style: TextStyle(
                                                decoration:
                                                TextDecoration.underline)),
                                        TextSpan(
                                            text:
                                            "I’m a Android Engineer based in New Delhi, India.\n\n"),
                                        TextSpan(
                                            text:
                                            "I love engineering and everthing related to it admires me. Want to be a part of some awsesome engineers which are changing world with there knowlegde and skills :)\n\n"),
                                        TextSpan(
                                            text:
                                            "I most of the time being on my laptor explore things, mostly technical. and always creating something by enjoying every part of it.\n\n"),
                                        TextSpan(
                                            text: "You can connect with me on ",
                                            children: [
                                              TextSpan(
                                                  text: "Instagram",
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  js.context.callMethod(
                                                      "open", [
                                                    "https://www.instagram.com/iamsahdeep"
                                                  ]);
                                                },
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .underline)),
                                              TextSpan(text: " & "),
                                              TextSpan(
                                                  text: "Twitter",
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                      js.context.callMethod(
                                                          "open", [
                                                        "https://www.twitter.com/iamsahdeep"
                                                      ]);
                                                    },
                                                  style: TextStyle(
                                                      decoration:
                                                      TextDecoration.underline))
                                            ]),
                                      ]),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                                !Utils.isMobileView(context) ? 100.0 : 10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 38.0,
                                      top:
                                      Utils.isMobileView(context) ? 50.0 : 0.0),
                                  child: Text(
                                    "Experience",
                                    style: TextStyle(fontSize: 50),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      !Utils.isMobileView(context) ? 50.0 : 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Android Engineer",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Bobble AI",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "2020-present",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Utils.getWidth(context) / 1.5,
                                  height: 2,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      Utils.isMobileView(context) ? 10 : 50.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Android Intern",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Asearch Online",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "2017-2017",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                                !Utils.isMobileView(context) ? 100.0 : 10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 38.0),
                                  child: Text(
                                    "Skills",
                                    style: TextStyle(fontSize: 50),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      Utils.isMobileView(context) ? 10 : 50.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Android",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Flutter",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Firebase",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Utils.getWidth(context) / 1.5,
                                  height: 2,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: Utils.isMobileView(context)
                                      ? EdgeInsets.all(10)
                                      : const EdgeInsets.only(
                                      top: 50.0, left: 50, right: 50),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Dart",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Kotlin",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Java",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      Utils.isMobileView(context) ? 10 : 50.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Git/Github",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Cloud/Libraries",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Rest Integration",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: Utils.isMobileView(context)
                                                  ? 15
                                                  : 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                        EdgeInsets.all(Utils.isMobileView(context) ? 10 : 18.0),
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          mouseCursor: SystemMouseCursors.none,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          onHover: (val) {
                            uiModel.setIsLogoHovering(val);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedContainer(
                              height: uiModel.isLogoHovering ? 60 : 50,
                              duration: const Duration(milliseconds: 200),
                              child: Image.asset(
                                "images/logo.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
