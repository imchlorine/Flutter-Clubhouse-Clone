import 'package:ClubHouseClone/screen/home_view.dart';
import 'package:ClubHouseClone/screen/search_view.dart';
import 'package:ClubHouseClone/share/route.dart' as route;
import 'package:flutter/cupertino.dart';

const String RootRoute = "/";
const String HomeViewRoute = "HomeView";
const String SearchViewRoute = "SearchView";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return _getPageRouteCupertino(
        viewToShow: HomeView(),
      );
    case SearchViewRoute:
      return _getPageRouteCupertino(
        viewToShow: SearchView(),
      );

    default:
      return _getPageRouteCupertino(
        viewToShow: CupertinoPageScaffold(
          child: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}

PageRoute _getPageRouteCupertino({Widget viewToShow}) {
  return route.CupertinoPageRoute<bool>(
    // fullscreenDialog: true,
    builder: (_) => viewToShow,
  );
}
