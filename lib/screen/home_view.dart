import 'package:ClubHouseClone/app/locator.dart';
import 'package:ClubHouseClone/app/navigation_service.dart';
import 'package:ClubHouseClone/app/route_names.dart';
import 'package:ClubHouseClone/model/topic_model.dart';
import 'package:ClubHouseClone/share/grid_icon.dart';
import 'package:ClubHouseClone/share/icon_add.dart';
import 'package:ClubHouseClone/share/nav_bar.dart' as nav_bar;
import 'package:ClubHouseClone/share/shared_style.dart';
import 'package:ClubHouseClone/share/snapping_scroll_physics.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
// import 'package:ClubHouseClone/share/text.dart' as text;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  NavigationService _navigationService = locator<NavigationService>();
  ScrollController _scrollController = ScrollController(initialScrollOffset: 0);
  bool showGridIcon = true;

  List<TopicModel> topicData;
  GlobalKey<GridIconState> gridIconKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listener);
    topicData = TopicModelData().topicData;
  }

  _listener() {
    if (_scrollController.offset >
        _scrollController.position.maxScrollExtent + 100) {
      _scrollController.animateTo(0,
          duration: Duration(milliseconds: 100), curve: Curves.ease);
    }
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
            _navigationService.navigateTo(SearchViewRoute);
          },
          child: Icon(
            CupertinoIcons.search,
            color: CupertinoColors.black,
          ),
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: GestureDetector(
                onTap: () => _navigationService.navigateTo(SearchViewRoute),
                child: Icon(
                  CupertinoIcons.mail,
                  color: CupertinoColors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: GestureDetector(
                onTap: () => _navigationService.navigateTo(SearchViewRoute),
                child: Icon(
                  CupertinoIcons.calendar_today,
                  color: CupertinoColors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: GestureDetector(
                onTap: () => _navigationService.navigateTo(SearchViewRoute),
                child: Icon(
                  CupertinoIcons.bell,
                  color: CupertinoColors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: GestureDetector(
                onTap: () => _navigationService.navigateTo(SearchViewRoute),
                child: Container(
                  height: 32,
                  width: 33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://images.pexels.com/photos/2078265/pexels-photo-2078265.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      child: ListView(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: SnappingScrollPhysics(
          itemExtent: MediaQuery.of(context).size.width / 1.3,
        ),
        children: [
          _mainView(),
          _slideView(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return GestureDetector(
      onTap: () => _navigationService.navigateTo(SearchViewRoute),
      child: Container(
        color: themeColor,
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Clubhouse is full of interesting people! \n Try following at least 25.",
                textAlign: TextAlign.center,
                textScaleFactor: 1,
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.bold,
                  // fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 115,
              width: double.infinity,
              alignment: Alignment.center,
              child: Container(
                width: 260,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 30,
                              top: 0,
                              child: IconAdd(
                                size: 38,
                                imageUrl:
                                    "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
                              ),
                            ),
                            Positioned(
                              left: 5,
                              top: 35,
                              child: IconAdd(
                                size: 25,
                                imageUrl:
                                    "https://images.pexels.com/photos/2078265/pexels-photo-2078265.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                              ),
                            ),
                            Positioned(
                              left: 80,
                              top: 0,
                              child: IconAdd(
                                  size: 49,
                                  imageUrl:
                                      "https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                            ),
                            Positioned(
                              left: 50,
                              top: 45,
                              child: IconAdd(
                                size: 38,
                                imageUrl:
                                    "https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                              ),
                            ),
                            Positioned(
                              left: 120,
                              top: 25,
                              child: IconAdd(
                                size: 60,
                                imageUrl:
                                    "https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                              ),
                            ),
                            Positioned(
                              left: 175,
                              top: 0,
                              child: IconAdd(
                                size: 35,
                                imageUrl:
                                    "https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                              ),
                            ),
                            Positioned(
                              left: 200,
                              top: 35,
                              child: IconAdd(
                                size: 35,
                                imageUrl:
                                    "https://images.pexels.com/photos/943084/pexels-photo-943084.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                              ),
                            ),
                            Positioned(
                              left: 220,
                              top: 10,
                              child: IconAdd(
                                size: 22,
                                imageUrl:
                                    "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: brown.withOpacity(0.1),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 80),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.person_crop_circle_badge_plus,
                          color: brown,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Find more people to follow",
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: brown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () =>
                        _navigationService.navigateTo(SearchViewRoute),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }

  Widget _slideView() {
    return Container(
      color: themeColor,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 1.3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No one you follow is online",
            textScaleFactor: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Positioned(
                  top: 3,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: brown.withOpacity(0.1),
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Text(
                    "Find people to follow",
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () =>
                      _navigationService.navigateTo(SearchViewRoute),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainView() {
    return VisibilityDetector(
      key: Key("main_page"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (gridIconKey.currentState != null) {
          if (info.visibleFraction == 1) {
            gridIconKey.currentState.changeState(true);
          } else {
            gridIconKey.currentState.changeState(false);
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _buildTitle(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: brown.withOpacity(0.2),
                              spreadRadius: 0.1,
                              blurRadius: 0.2,
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                        margin:
                            EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            topicData[index].clubName != null
                                ? Text(
                                    topicData[index].clubName.toUpperCase() +
                                        "  ${EmojiParser().get("house").code}",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : Container(),
                            Text(
                              topicData[index].topicTitle,
                              textScaleFactor: 1,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 100,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          clipBehavior: Clip.hardEdge,
                                          child: CachedNetworkImage(
                                            imageUrl: topicData[index]
                                                .users[1]
                                                .userImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          left: 30,
                                          top: 25,
                                          child: Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                            child: CachedNetworkImage(
                                              imageUrl: topicData[index]
                                                  .users[0]
                                                  .userImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...List.generate(
                                            topicData[index].users.length, (i) {
                                          return Text(
                                            topicData[index].users[i].userName +
                                                " ${EmojiParser().get("speech_balloon").code}",
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          );
                                        }),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${topicData[index].audienceNumber} ",
                                              textScaleFactor: 1,
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            Icon(
                                              Icons.person,
                                              color: brown,
                                              size: 12,
                                            ),
                                            Text(
                                              "  /  ",
                                              textScaleFactor: 1,
                                              style: TextStyle(fontSize: 11),
                                            ),
                                            Text(
                                              "${topicData[index].speechNumber} ",
                                              textScaleFactor: 1,
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            Icon(
                                              CupertinoIcons.chat_bubble_text,
                                              color: brown,
                                              size: 12,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: topicData.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: _explore(),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 100,
              child: _bottomView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _explore() {
    return Column(
      children: [
        Container(
          width: 150,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CupertinoButton(
            borderRadius: BorderRadius.circular(20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: brown.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  EmojiParser().get("earth_asia").code,
                  textScaleFactor: 1,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Explore",
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onPressed: () => _navigationService.navigateTo(SearchViewRoute),
          ),
        ),
        SizedBox(height: 150),
      ],
    );
  }

  Widget _bottomView() {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [themeColor.withOpacity(0.1), themeColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CupertinoButton(
                      borderRadius: BorderRadius.circular(20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.plus,
                            color: white,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Start a room",
                            textScaleFactor: 1,
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () =>
                          _navigationService.navigateTo(SearchViewRoute),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GridIcon(
                    key: gridIconKey,
                    onTap: () {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: themeColor,
            ),
          ),
        ],
      ),
    );
  }
}
