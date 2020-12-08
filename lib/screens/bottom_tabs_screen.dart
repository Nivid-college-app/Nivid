import 'package:Nivid/global/variables.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:Nivid/screens/mess_screen.dart';
import 'package:Nivid/widgets/main_drawer.dart';
import 'package:Nivid/screens/gallery_screen.dart';
import 'package:Nivid/screens/add_news_screen.dart';
import 'package:Nivid/screens/add_post_screen.dart';
import 'package:Nivid/screens/home_feed_screen.dart';
import 'package:Nivid/screens/news_feed_screen.dart';
import 'package:Nivid/helpers/custom_scale_route.dart';

class BottomTabsScreen extends StatefulWidget {
  static const routeName = '\BottomTabsScreen';
  final int index;
  BottomTabsScreen({this.index = 0});
  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  int _selected;
  int _count = 0;
  Size _size;

  void _onPressed(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selected = widget.index;
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return Future.delayed(Duration(seconds: 0), () {
          if (_count == 0) {
            _count++;
            Fluttertoast.showToast(
                msg: 'Press again to exit',
                backgroundColor: Colors.grey[800],
                textColor: Colors.white);
            Future.delayed(Duration(seconds: 2), () => _count = 0);
            return false;
          } else
            return true;
        });
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              title: Text(['Home', 'News', 'Mess', 'Gallery'][_selected])),
          drawer: MainDrawer(),
          bottomNavigationBar: CurvedNavigationBar(
            height: _size.height * 0.07,
            animationDuration: Duration(milliseconds: 300),
            buttonBackgroundColor: Theme.of(context).primaryColor,
            color: Theme.of(context).primaryColor.withOpacity(0.75),
            backgroundColor: Colors.transparent,
            onTap: _onPressed,
            index: _selected,
            items: [
              _selected == 0
                  ? FutureBuilder(
                      future: Future.delayed(Duration(milliseconds: 150)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return Icon(FlutterIcons.home_ant,
                              color: Colors.blueGrey[300]);
                        return Container(
                          height: _size.width * 0.1,
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Column(
                              children: [
                                Icon(FlutterIcons.home_ant,
                                    color: Colors.white),
                                Text('Home',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        );
                      })
                  : Icon(FlutterIcons.home_ant, color: Colors.white),
              _selected == 1
                  ? FutureBuilder(
                      future: Future.delayed(Duration(milliseconds: 150)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return Icon(FlutterIcons.newspaper_mco,
                              color: Colors.blueGrey[300]);
                        return Container(
                          height: _size.width * 0.1,
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Column(
                              children: [
                                Icon(FlutterIcons.newspaper_mco,
                                    color: Colors.white),
                                Text('News',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        );
                      })
                  : Icon(FlutterIcons.newspaper_mco, color: Colors.white),
              _selected == 2
                  ? FutureBuilder(
                      future: Future.delayed(Duration(milliseconds: 150)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return Icon(Icons.restaurant_menu,
                              color: Colors.blueGrey[300]);
                        return Container(
                          height: _size.width * 0.1,
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Column(
                              children: [
                                Icon(Icons.restaurant_menu,
                                    color: Colors.white),
                                Text('Mess',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        );
                      })
                  : Icon(Icons.restaurant_menu, color: Colors.white),
              _selected == 3
                  ? FutureBuilder(
                      future: Future.delayed(Duration(milliseconds: 150)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return Icon(FlutterIcons.google_photos_mco,
                              color: Colors.blueGrey[300]);
                        return Container(
                          height: _size.width * 0.1,
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Column(
                              children: [
                                Icon(FlutterIcons.google_photos_mco,
                                    color: Colors.white),
                                Text('Gallery',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        );
                      })
                  : Icon(FlutterIcons.google_photos_mco, color: Colors.white),
            ],
          ),
          body: [
            HomeFeedScreen(),
            NewsFeedScreen(),
            MessScreen(),
            GalleryScreen()
          ][_selected],
          extendBody: true,
          floatingActionButton: (_selected == 0 || _selected == 1) &&
                  userData.isAdmin
              ? FloatingActionButton.extended(
                  foregroundColor: Colors.white,
                  label: Text(_selected == 0 ? 'Add post' : 'Update',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  onPressed: () => Navigator.of(context).push(CustomScaleRoute(
                      _selected == 0 ? AddPostScreen() : AddNewsScreen(),
                      alignment: Alignment.bottomRight)),
                  icon: Icon(Icons.add),
                  backgroundColor: Theme.of(context).primaryColor,
                )
              : null),
    );
  }
}
