import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Nivid/widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected = 0;
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selected,
        onTap: _onPressed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(FlutterIcons.home_ant), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(FlutterIcons.newspaper_mco), title: Text('News')),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), title: Text('Mess')),
          BottomNavigationBarItem(
              icon: Icon(FlutterIcons.google_photos_mco), title: Text('Photos'))
        ],
      ),
    );
  }
}
