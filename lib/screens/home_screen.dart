import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:Nivid/widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected = 0;
  Size _size;
  List<Widget> tabs = [
    Center(child: Text('Nivid College App')),
    Center(child: Text('Nivid College App')),
    Center(child: Text('Nivid College App')),
    Center(child: Text('Nivid College App'))
  ];
  List<String> titles = ['Home', 'News', 'Mess', 'Photo gallary'];

  void _onPressed(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selected]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tabs[_selected],
          SizedBox(height: 45),
          Text(titles[_selected]),
        ],
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        height: _size.height * 0.07,
        animationDuration: Duration(milliseconds: 300),
        color: Theme.of(context).primaryColor,
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
                            Icon(FlutterIcons.home_ant, color: Colors.white),
                            Text('Home', style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    );
                  })
              : Icon(FlutterIcons.home_ant, color: Colors.blueGrey[300]),
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
                            Text('News', style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    );
                  })
              : Icon(FlutterIcons.newspaper_mco, color: Colors.blueGrey[300]),
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
                            Icon(Icons.restaurant_menu, color: Colors.white),
                            Text('Mess', style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    );
                  })
              : Icon(Icons.restaurant_menu, color: Colors.blueGrey[300]),
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
                            Text('Gallary',
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    );
                  })
              : Icon(FlutterIcons.google_photos_mco,
                  color: Colors.blueGrey[300]),
        ],
      ),
    );
  }
}
