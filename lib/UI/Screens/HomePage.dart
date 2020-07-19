import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sahdeepsinghflutter/CORE/ProviderModel.dart';
import 'package:sahdeepsinghflutter/CORE/Utils.dart';
import 'package:flutter/src/rendering/mouse_cursor.dart';
import 'package:sahdeepsinghflutter/UI/Others/HomeScreenCursor.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  static const String TAG = "HomePage";
  static const String Route = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final uiModel = Provider.of<UIModel>(context);
    return Scaffold(
      backgroundColor: Color(0xff000000),
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
              Positioned(
                  left: uiModel.pointerPosition.dx,
                  top: uiModel.pointerPosition.dy,
                  child: Container(
                    width: 3,
                    height: 3,
                    color: Colors.white,
                  )),
              Positioned(
                left: Utils.getCursorMainScreenWithRangeW(
                    uiModel.pointerPosition.dx, context),
                top: Utils.getCursorMainScreenWithRangeH(
                    uiModel.pointerPosition.dy, context),
                child: HomeScreenCursor(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Transform.rotate(
                    angle: uiModel.isLogoHovering ? 50 : 0,
                    child: InkWell(
                      onTap: () {},
                      onHover: (val) {
                        uiModel.setIsLogoHovering(val);
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
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    onTap: () {},
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
                alignment: Alignment.bottomLeft,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.twitter,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                js.context.callMethod(
                                    "open", ["https://twitter.com/iamSahdeep"]);
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.github,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                js.context.callMethod(
                                    "open", ["https://github.com/iamSahdeep"]);
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.linkedin,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                js.context.callMethod("open",
                                    ["https://www.linkedin.com/in/iamsahdeep"]);
                              }),
                        ),
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "© Sahdeep Singh, ",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        Text(
                          "Build with ❤ and ",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        InkWell(
                          onTap: () {
                            js.context.callMethod(
                                "open", ["https://github.com/flutter/flutter"]);
                          },
                          child: Text(
                            "Flutter",
                            style: TextStyle(color: Colors.white, fontSize: 17),
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
