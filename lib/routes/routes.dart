import 'package:get/get.dart';
import 'package:bonnou/views/about/about_page.dart';
import 'package:bonnou/views/rss/all_rss_page.dart';
import 'package:bonnou/views/rss/create_rss_page.dart';
import 'package:bonnou/views/rss/update_rss_page.dart';
import 'package:bonnou/views/home/home_page.dart';
import 'package:bonnou/views/bad_news/bad_news_page.dart';
import 'package:bonnou/views/settings/settings_page.dart';

class MyRoutes {
  static const String _home = "/";
  static const String _badNews = "/BadNewsPage";
  static const String _allRss = "/AllRssPage";
  static const String _createRss = "/CreateRssPage";
  static const String _updateRss = "/UpdateRssPage";
  static const String _settings= "/SettingsPage";
  static const String _about= "/AboutPage";
  static const Duration _duration = Duration(milliseconds: 400);

  static String getHomeRoute() => _home;
  static String getBadNewsRoute() => _badNews;
  static String getAllRssPageRoute() => _allRss;
  static String getCreateRssRoute() => _createRss;
  static String getUpdateRssRoute() => _updateRss;
  static String getSettingsRoute() => _settings;
  static String getAboutRoute() => _about;

  static List<GetPage> routes = [
    GetPage(
      name: _home,
      page: () => HomePage(),
      transition: Transition.fade,
      transitionDuration: _duration,
    ),
    GetPage(
      name: _badNews,
      page: () => BadNewsPage(),
      transition: Transition.fade,
      transitionDuration: _duration,
    ),
    GetPage(
      name: _allRss,
      page: () => AllRssPage(),
      transition: Transition.zoom,
      transitionDuration: _duration,
    ),
    GetPage(
      name: _createRss,
      page: () => CreateRssPage(),
      transition: Transition.zoom,
      transitionDuration: _duration,
    ),
    GetPage(
      name: _updateRss,
      page: () => UpdateRssPage(),
      transition: Transition.zoom,
      transitionDuration: _duration,
    ),
    GetPage(
      name: _settings,
      page: () => const SettingsPage(),
      transition: Transition.zoom,
      transitionDuration: _duration,
    ),
    GetPage(
      name: _about,
      page: () => AboutPage(),
      transition: Transition.zoom,
      transitionDuration: _duration,
    )
  ];
}