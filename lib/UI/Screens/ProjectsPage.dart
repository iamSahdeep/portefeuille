import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sahdeepsinghflutter/CORE/Data/ProjectsData.dart';
import 'package:sahdeepsinghflutter/CORE/ProviderModels/CursorProvider.dart';
import 'package:sahdeepsinghflutter/CORE/ProviderModels/ProjectProvider.dart';
import 'package:sahdeepsinghflutter/CORE/Utils.dart';
import 'package:sahdeepsinghflutter/UI/Screens/ProjectDetailsPage.dart';

class ProjectPage extends StatefulWidget {
  static const String TAG = "ProjectPage";
  static const String Route = "/projects";

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  ScrollController scrollController, listController;

  double scrollOffset = 0;

  @override
  initState() {
    super.initState();
    scrollController = ScrollController(initialScrollOffset: 0);
    listController = ScrollController(initialScrollOffset: 0);
    scrollController.addListener(() {
      setState(() {
        scrollOffset = scrollController.offset;
      });
      listController.jumpTo(scrollOffset);
    });
    Provider.of<ProjectProvider>(context, listen: false).currentProjectIndex =
        0;
  }

  @override
  didChangeDependencies() {
    ProjectsData.allProjects.forEach((element) {
      precacheImage(AssetImage(element.banner), context);
    });
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final uiModel = Provider.of<CursorProvider>(context);
    final proModel = Provider.of<ProjectProvider>(context);
    return Scaffold(
        body: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: Utils.getHeight(context),
      width: Utils.getWidth(context),
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Container(
              height: getAllItemsWidth(),
              width: Utils.getWidth(context),
            ),
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
                    padding: const EdgeInsets.all(5.0),
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: Utils.getWidth(context) / 1.5,
                    height: Utils.getWidth(context) / 3.5,
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Hero(
                              tag: ProjectsData
                                  .allProjects[proModel.currentProjectIndex]
                                  .slug,
                              child: Image.asset(
                                ProjectsData
                                    .allProjects[proModel.currentProjectIndex]
                                    .banner,
                                fit: BoxFit.cover,
                                gaplessPlayback: true,
                                width: Utils.getWidth(context) / 1.5 - 30,
                                height: Utils.getWidth(context) / 3.5 - 30,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (_) {
                              uiModel.setIsHoveringMoreDetails(true);
                            },
                            onExit: (_) {
                              uiModel.setIsHoveringMoreDetails(false);
                            },
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  ProjectDetailsPage.routeFromSlug(ProjectsData
                                      .allProjects[proModel.currentProjectIndex]
                                      .slug),
                                );
                              },
                              child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  padding: EdgeInsets.all(
                                      uiModel.isHoveringMoreDetails ? 20 : 15),
                                  color: uiModel.isHoveringMoreDetails
                                      ? Colors.purpleAccent
                                      : Colors.amber,
                                  child: Text(
                                    "More Details",
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      ProjectsData
                          .allProjects[proModel.currentProjectIndex].title,
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                      ProjectsData.allProjects[proModel.currentProjectIndex]
                          .shortDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal)),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: Utils.getWidth(context) / 2 - 30,
              child: SingleChildScrollView(
                controller: listController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buildScrollableChild(),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            left: Utils.getBarPositionFromLeft(
                scrollOffset + Utils.getHeight(context) / 2,
                getAllItemsWidth(),
                context),
            child: Container(
              width: 2,
              height: Utils.getHeight(context),
              color: Colors.amber,
            ),
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    ));
  }

  List<Widget> buildScrollableChild() {
    List<Widget> data = [];
    final proModel = Provider.of<ProjectProvider>(context);
    double width = 0;
    ProjectsData.allProjects.forEach((element) {
      bool temp = (scrollOffset + Utils.getHeight(context) / 2) >= width &&
          scrollOffset + Utils.getHeight(context) / 2 <
              width + element.scrollLength + 40;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (temp) {
          proModel.setCurrentProjectIndex(element.id - 1);
        }
      });

      data.add(Padding(
        padding: EdgeInsets.only(
            top: element.scrollLength / 10, left: 20, right: 20),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: element.scrollLength,
            height: 10,
            color: temp ? Colors.amber : Colors.black),
      ));
      width += (element.scrollLength + 40);
    });
    return data;
  }

  double getAllItemsWidth() {
    double height = 0;
    ProjectsData.allProjects.forEach((element) {
      height += (element.scrollLength + 40);
    });
    return height;
  }

  @override
  void dispose() {
    scrollController.dispose();
    listController.dispose();
    super.dispose();
  }
}
