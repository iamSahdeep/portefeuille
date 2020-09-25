import 'dart:js' as js;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahdeepsinghflutter/CORE/DataModels/ProjectModel.dart';
import 'package:sahdeepsinghflutter/CORE/Utils.dart';
import 'package:sahdeepsinghflutter/UI/Others/HoverableButton.dart';

class ProjectDetailsPage extends StatefulWidget {
  static const String TAG = "ProjectDetailsPage";
  static const String Route = "/project";

  static String Function(String slug) routeFromSlug =
      (String slug) => Route + '/$slug';

  final Project project;

  const ProjectDetailsPage({Key key, this.project}) : super(key: key);

  @override
  _ProjectDetailsPageState createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  didChangeDependencies() {
    precacheImage(AssetImage(widget.project.banner), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Project project = widget.project;
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: widget.project.slug,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset(
                      widget.project.banner,
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                      width: Utils.getWidth(context) / 1.1,
                      height: Utils.getWidth(context) / 3,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: project.yearAndTech.length,
                        itemBuilder: (context, index) {
                          return Center(
                              child: Padding(
                            padding: EdgeInsets.all(index == 0 ? 30 : 12.0),
                            child: Text(
                              project.yearAndTech[index],
                              style: TextStyle(fontSize: index == 0 ? 30 : 20),
                            ),
                          ));
                        }),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            project.title,
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            project.shortDescription,
                            style: TextStyle(fontSize: 30),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  width: Utils.getWidth(context) / 1.2,
                  height: 2,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Text(
                  project.longDescription,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  width: Utils.getWidth(context) / 1.2,
                  height: 2,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: getLinks(project),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: HoverableButton(
                height: 40,
                width: 100,
                child: Text(
                  "X Close",
                  style: TextStyle(color: Colors.amber),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        )
      ],
    ));
  }

  List<Widget> getLinks(Project project) {
    List<Widget> temp = [];
    if (project.githubLink.isNotEmpty) {
      temp.add(
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: HoverableButton(
              height: 40,
              width: 40,
              child: Icon(
                FontAwesomeIcons.github,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                js.context.callMethod("open", [project.githubLink]);
              }),
        ),
      );
    }

    if (project.playstoreLink.isNotEmpty) {
      temp.add(
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: HoverableButton(
              height: 40,
              width: 40,
              child: Icon(
                FontAwesomeIcons.googlePlay,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                js.context.callMethod("open", [project.playstoreLink]);
              }),
        ),
      );
    }

    return temp;
  }
}
