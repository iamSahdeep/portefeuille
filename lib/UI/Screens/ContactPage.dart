import 'dart:html';
import 'dart:js' as js;
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sahdeepsinghflutter/CORE/ProviderModels/CursorProvider.dart';
import 'package:sahdeepsinghflutter/CORE/Utils.dart';
import 'package:sahdeepsinghflutter/UI/Others/CustomDrawer.dart';
import 'package:sahdeepsinghflutter/UI/Others/HoverableButton.dart';

class ContactPage extends StatefulWidget {
  static const String Route = "/contact";

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Widget _iframeWidget;

  @override
  void initState() {
    super.initState();

    final IFrameElement _iframeElement = IFrameElement();
    _iframeElement.height = '500';
    _iframeElement.width = '500';
    _iframeElement.src = 'https://form.typeform.com/to/Lmd3Ng1B';
    _iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    final uiModel = Provider.of<CursorProvider>(context);

    return Scaffold(
      endDrawer: CustomDrawer(),
      backgroundColor: Color(0xff262626),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(Utils.isMobileView(context) ? 10 : 18.0),
              child: InkWell(
                hoverColor: Colors.transparent,
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
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Contact Me",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "Don't be a Stranger, just say hello :)",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Hi there! Its always a joy to hear from you :D\n\nPlease fill the contact form below",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 500,
                      width: Utils.isMobileView(context)
                          ? Utils.getWidth(context)
                          : Utils.getWidth(context) / 1.5,
                      child: _iframeWidget,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 100, left: 12, right: 12),
                      child: Text(
                        "You can also email me",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 48.0),
                      child: GestureDetector(
                          child: Text("sahdeepsingh98@gmail.com",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal)),
                          onTap: () {
                            //js.context.callMethod("openUrlPwa",['mailto:sahdeepsingh98@gmail.com']);
                          }),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: HoverableButton(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    js.context.callMethod("open",
                                        ["https://twitter.com/iamSahdeep"]);
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: HoverableButton(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    js.context.callMethod(
                                        "open", ["https://fb.com/iamSahdeep"]);
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: HoverableButton(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    FontAwesomeIcons.linkedinIn,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    js.context.callMethod("open", [
                                      "https://www.linkedin.com/in/iamsahdeep"
                                    ]);
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: HoverableButton(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    FontAwesomeIcons.instagram,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    js.context.callMethod("open", [
                                      "https://www.instagram.com/iamsahdeep"
                                    ]);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
