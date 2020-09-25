import 'package:sahdeepsinghflutter/CORE/DataModels/ProjectModel.dart';

class ProjectsData {
  static const List<Project> allProjects = [
    Project(
      id: 1,
      title: 'Liquid Swipe Flutter',
      slug: 'liquid_swipe_flutter',
      scrollLength: 1000.0,
      banner: "images/liquidswipe.png",
    ),
    Project(
      id: 2,
      title: 'Personal Portfolio',
      slug: 'personal_portfolio',
      scrollLength: 500.0,
      banner: "images/personal_portfolio_banner.png",
    ),
    Project(
      id: 3,
      title: 'MineSweeper Flutter',
      slug: 'mineSweeper_flutter',
      scrollLength: 1000.0,
      banner: "images/minesweeper_flutter_banner.png",
    ),
    Project(
      id: 4,
      title: 'A very interesting article',
      slug: 'a-very-interesting-article',
      scrollLength: 500.0,
      banner: "images/liquidswipe.png",
    ),
    Project(
      id: 5,
      title: 'A very interesting article',
      slug: 'a-very-interesting-article',
      scrollLength: 1000.0,
      banner: "images/liquidswipe.png",
    ),
  ];

  static int getProjectIDFromSlug(String slug) {
    allProjects.forEach((element) {
      if (element.slug == slug) {
        return element.id;
      }
    });

    return 0;
  }
}
