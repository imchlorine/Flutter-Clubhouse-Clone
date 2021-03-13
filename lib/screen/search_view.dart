import 'package:ClubHouseClone/app/locator.dart';
import 'package:ClubHouseClone/app/navigation_service.dart';
import 'package:ClubHouseClone/share/shared_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:ClubHouseClone/share/nav_bar.dart' as nav_bar;
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchViewState();
  }
}

class _SearchViewState extends State<SearchView> with WidgetsBindingObserver {
  NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: themeColor,
      navigationBar: nav_bar.CupertinoNavigationBar(
        border: null,
        padding: EdgeInsetsDirectional.fromSTEB(15, 20, 5, 15),
        backgroundColor: themeColor,
        leading: GestureDetector(
          onTap: () {
            _navigationService.pop();
          },
          child: Icon(
            CupertinoIcons.back,
            color: CupertinoColors.black,
          ),
        ),
        middle: Text(
          "EXPLORE",
          textScaleFactor: 1.0,
          style: TextStyle(fontSize: 16, color: black),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Search",
              style: TextStyle(color: black),
            ),
          )
        ],
      ),
    );
  }
}
