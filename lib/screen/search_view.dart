import 'package:ClubHouseClone/app/locator.dart';
import 'package:ClubHouseClone/app/navigation_service.dart';
import 'package:ClubHouseClone/share/my_sliver_appbar_delegate.dart';
import 'package:ClubHouseClone/share/shared_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        padding: EdgeInsetsDirectional.zero,
        backgroundColor: themeColor,
        automaticallyImplyLeading: false,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            CupertinoIcons.back,
            size: 35,
            color: CupertinoColors.black,
          ),
          onPressed: () {
            _navigationService.pop();
          },
        ),
        middle: Text(
          "EXPLORE",
          textScaleFactor: 1.0,
          style: TextStyle(fontSize: 16, color: black),
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverAppBarDelegate(
              child: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: _searchWidget(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 30, 16, 10),
              child: Text(
                "PEOPLE TO FELLOW",
                textScaleFactor: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 80,
                  color: followColor,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://content.fortune.com/wp-content/uploads/2021/02/GettyImages-1229901940.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Elon Mask",
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, est eius accusata maluisset eu, omnis aperiam accusamus sit ex.",
                              textScaleFactor: 1,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      FlatButton(
                        child: Text(
                          "Follow",
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: indigo,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: indigo,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
              childCount: 3,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 30, 16, 10),
              child: Text(
                "FIND CONVERSATIONS ABOUT...",
                textScaleFactor: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _searchWidget() {
    return Container(
      height: 50,
      color: themeColor,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: search,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 5,
                ),
                Icon(
                  CupertinoIcons.search,
                  color: black.withOpacity(0.5),
                  size: 22,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Find People and Clubs",
                      maxLines: 2,
                      style: TextStyle(
                        color: black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
