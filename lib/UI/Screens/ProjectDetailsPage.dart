import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portefeuille/CORE/DataModels/ProjectModel.dart';
import 'package:portefeuille/CORE/Utils.dart';
import 'package:portefeuille/UI/Others/HoverableButton.dart';
import 'package:seo_renderer/helpers/utils.dart';
import 'package:seo_renderer/seo_renderer.dart';

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

  final RenderController renderController = RenderController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      //renderController.refresh.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    Project project = widget.project;
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
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
                      fit: BoxFit.fitWidth,
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
                  Utils.isMobileView(context)
                      ? SizedBox()
                      : Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: project.yearAndTech.length,
                              itemBuilder: (context, index) {
                                return Center(
                                    child: Padding(
                                  padding:
                                      EdgeInsets.all(index == 0 ? 30 : 12.0),
                                  child: Text(
                                    project.yearAndTech[index],
                                    style: TextStyle(
                                        fontSize: index == 0 ? 30 : 20),
                                  ),
                                ));
                              }),
                        ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          type: MaterialType.transparency,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  TextRenderer(
                                    text: Text(
                                      project.title,
                                      style: TextStyle(
                                          fontSize:
                                              Utils.isMobileView(context)
                                                  ? 30
                                                  : 40),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextRenderer(
                            text: Text(
                              project.shortDescription,
                              style: TextStyle(
                                  fontSize:
                                      Utils.isMobileView(context) ? 20 : 30),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              !Utils.isMobileView(context)
                  ? SizedBox()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: project.yearAndTech.length,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Padding(
                          padding: EdgeInsets.all(index == 0 ? 30 : 12.0),
                          child: TextRenderer(
                            text: Text(
                              project.yearAndTech[index],
                              style: TextStyle(fontSize: index == 0 ? 30 : 20),
                            ),
                          ),
                        ));
                      }),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  width: Utils.getWidth(context) / 1.2,
                  height: 2,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.all(Utils.isMobileView(context) ? 30 : 60.0),
                child: TextRenderer(
                  text: Text(
                    project.longDescription,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: Utils.isMobileView(context) ? 16 : 20),
                  ),
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
                  "X",
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
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
                Utils.launchURL(project.githubLink);
              }),
        ),
      );
    }

    if (project.playstoreLink.isNotEmpty) {
      temp.add(
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: LinkRenderer(
            anchorText: 'Playstore',
            link: project.playstoreLink,
            child: HoverableButton(
                height: 40,
                width: 40,
                child: Icon(
                  FontAwesomeIcons.googlePlay,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Utils.launchURL(project.playstoreLink);
                }),
          ),
        ),
      );
    }

    return temp;
  }
}
