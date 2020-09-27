import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/rendering/mouse_cursor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sahdeepsinghflutter/CORE/ProviderModels/CursorProvider.dart';
import 'package:sahdeepsinghflutter/CORE/Utils.dart';
import 'package:sahdeepsinghflutter/UI/Others/CustomDrawer.dart';
import 'package:sahdeepsinghflutter/UI/Others/HomeScreenCursor.dart';
import 'package:sahdeepsinghflutter/UI/Others/HoverableButton.dart';

class HomePage extends StatefulWidget {
  static const String TAG = "HomePage";
  static const String Route = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final uiModel = Provider.of<CursorProvider>(context);
    return Scaffold(
      key: globalKey,
      endDrawer: CustomDrawer(),
      body: MouseRegion(
        cursor: SystemMouseCursors.none,
        onHover: (event) {
          uiModel.setPointerPosition(event.position);
        },
        child: SizedBox(
          width: Utils.getWidth(context),
          height: Utils.getHeight(context),
          child: Stack(
            children: [
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  left: uiModel.pointerPosition.dx,
                  top: uiModel.pointerPosition.dy,
                  child: Container(
                    width: 3,
                    height: 3,
                    color: Colors.white,
                  )),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                left: Utils.getCursorMainScreenWithRangeW(
                    uiModel.pointerPosition.dx, context),
                top: Utils.getCursorMainScreenWithRangeH(
                    uiModel.pointerPosition.dy, context),
                child: HomeScreenCursor(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      EdgeInsets.all(Utils.isMobileView(context) ? 10 : 18.0),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    mouseCursor: SystemMouseCursors.none,
                    onTap: () {},
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
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding:
                  EdgeInsets.all(Utils.isMobileView(context) ? 10 : 15.0),
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
              Align(
                alignment: Utils.isMobileView(context)
                    ? Alignment.bottomCenter
                    : Alignment.bottomLeft,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HoverableButton(
                            height: 40,
                            width: 60,
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () {
                              js.context.callMethod(
                                  "open", ["https://twitter.com/iamSahdeep"]);
                            }),
                        HoverableButton(
                            height: 40,
                            width: 60,
                            child: Icon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () {
                              js.context.callMethod(
                                  "open", ["https://github.com/iamSahdeep"]);
                            }),
                        HoverableButton(
                            height: 40,
                            width: 60,
                            child: Icon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () {
                              js.context.callMethod("open",
                                  ["https://www.linkedin.com/in/iamsahdeep"]);
                            }),
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Utils.isMobileView(context)
                    ? SizedBox()
                    : Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "© Sahdeep Singh, ",
                          style:
                          TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        Text(
                          "Build with ❤ and ",
                          style:
                          TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        HoverableButton(
                          height: 30,
                          width: 70,
                          onPressed: () {
                            js.context.callMethod("open",
                                ["https://github.com/flutter/flutter"]);
                          },
                          child: Text(
                            "Flutter",
                            style: TextStyle(
                                color: Colors.white, fontSize: 17),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
