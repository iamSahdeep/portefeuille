import 'package:sahdeepsinghflutter/CORE/DataModels/ProjectModel.dart';

class ProjectsData {
  static const List<Project> allProjects = [
    Project(
      id: 1,
      title: 'Liquid Swipe Flutter',
      slug: 'liquid-swipe-flutter',
      scrollLength: 1000.0,
      banner: "images/liquidswipe.png",
      shortDescription:
          "Liquid swipe is the revealing clipper to bring off amazing liquid like swipe to stacked Container",
      longDescription:
          """Liquid Swipe provides great animation without much boilerplate code. The implementation is simple and easy to use with a list of Containers and can be applied to almost any widget within them. \n\n Liquid Swipe package would be quite useful for anyone who wants to add some kind of out-of-the-box animation to their app.\nAn animation like this is otherwise quite complex and time-consuming to design but this package makes it simple to implement within a matter of minutes.""",
      githubLink: "https://github.com/iamSahdeep/liquidswipeflutter",
      playstoreLink: "",
    ),
    Project(
      id: 2,
      title: 'Personal Portfolio',
      slug: 'personal-portfolio',
      scrollLength: 900.0,
      banner: "images/personal_portfolio_banner.png",
      shortDescription: "My Personal Portfolio website that you are currently using.",
      longDescription: """Liquid Swipe provides great animation without much boilerplate code. The implementation is simple and easy to use with a list of Containers and can be applied to almost any widget within them. \n\n Liquid Swipe package would be quite useful for anyone who wants to add some kind of out-of-the-box animation to their app.\nAn animation like this is otherwise quite complex and time-consuming to design but this package makes it simple to implement within a matter of minutes.""",
      githubLink: "https://github.com/iamSahdeep/liquidswipeflutter",
      playstoreLink: "",
    ),
    Project(
      id: 3,
      title: 'MineSweeper Flutter',
      slug: 'mineSweeper-flutter',
      scrollLength: 1000.0,
      banner: "images/mine_banner.png",
      shortDescription: "Minesweeper - Clean & Smooth, a free and offline classic minesweeper game but with new classy look and amazing themes.",
      longDescription: """Under Development - Might be unstable and lacks some basic features for now.\n\nMinesweeper - Clean & Smooth, a free and offline classic minesweeper game but with new classy look and amazing themes.\n\nThis Game is completely free and does not contain any type of ad. So everything is premium here :) \n\nYou can choose your favorite colors and begin your smoothest and most elegant journey through endless amount of Minesweeper puzzle.""",
      githubLink: "https://github.com/iamSahdeep/minesweeper_flutter",
      playstoreLink: "",
    ),
    Project(
      id: 4,
      title: 'Bop Music Player',
      slug: 'a-music-player',
      scrollLength: 700.0,
      banner: "images/bop_banner.png",
      shortDescription: "Liquid swipe is the revealing clipper to bring off amazing liquid like swipe to stacked Container",
      longDescription: """Liquid Swipe provides great animation without much boilerplate code. The implementation is simple and easy to use with a list of Containers and can be applied to almost any widget within them. \n\n Liquid Swipe package would be quite useful for anyone who wants to add some kind of out-of-the-box animation to their app.\nAn animation like this is otherwise quite complex and time-consuming to design but this package makes it simple to implement within a matter of minutes.""",
      githubLink: "https://github.com/iamSahdeep/liquidswipeflutter",
      playstoreLink: "",
    ),
    Project(
      id: 5,
      title: 'Flutter Visualizers',
      slug: 'flutter-visualizers',
      scrollLength: 500.0,
      banner: "images/visualizers_banner.png",
      shortDescription: "Liquid swipe is the revealing clipper to bring off amazing liquid like swipe to stacked Container",
      longDescription: """Liquid Swipe provides great animation without much boilerplate code. The implementation is simple and easy to use with a list of Containers and can be applied to almost any widget within them. \n\n Liquid Swipe package would be quite useful for anyone who wants to add some kind of out-of-the-box animation to their app.\nAn animation like this is otherwise quite complex and time-consuming to design but this package makes it simple to implement within a matter of minutes.""",
      githubLink: "https://github.com/iamSahdeep/liquidswipeflutter",
      playstoreLink: "",
    ),
    Project(
      id: 6,
      title: 'Fu Uber',
      slug: 'flutter-fuber',
      scrollLength: 1000.0,
      banner: "images/fuber_banner.png",
      shortDescription: "Liquid swipe is the revealing clipper to bring off amazing liquid like swipe to stacked Container",
      longDescription: """Liquid Swipe provides great animation without much boilerplate code. The implementation is simple and easy to use with a list of Containers and can be applied to almost any widget within them. \n\n Liquid Swipe package would be quite useful for anyone who wants to add some kind of out-of-the-box animation to their app.\nAn animation like this is otherwise quite complex and time-consuming to design but this package makes it simple to implement within a matter of minutes.""",
      githubLink: "https://github.com/iamSahdeep/liquidswipeflutter",
      playstoreLink: "",
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
