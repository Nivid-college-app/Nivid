import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainDrawer extends StatelessWidget {
  static Size size;
  static double top;

  Widget getDrawerButton(
      {@required String title,
      @required IconData icon,
      @required Function onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width,
        height: top * 1.75,
        child: Row(
          children: [
            SizedBox(width: top * 0.75),
            Icon(icon, size: 24, color: Colors.blue),
            SizedBox(width: top),
            Text(title, style: TextStyle(fontSize: 16, color: Colors.blue)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    top = MediaQuery.of(context).padding.top;
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(left: size.width * 0.025),
            leading: CircleAvatar(
                radius: size.width * 0.075,
                backgroundImage: AssetImage('assets/images/app_icon.png')),
            title: Text('IIIT Kottayam', style: TextStyle(fontSize: 18)),
            subtitle:
                Text('Hello there, welcome!', style: TextStyle(fontSize: 16)),
          ),
          Divider(thickness: 1, color: Colors.blueGrey),
          getDrawerButton(
              title: 'Academics',
              icon: FlutterIcons.school_mdi,
              onPressed: () {}),
          Divider(thickness: 1, height: 5),
          getDrawerButton(
              title: 'Schedule',
              icon: FlutterIcons.timetable_mco,
              onPressed: () {}),
          Divider(thickness: 1, height: 5),
          getDrawerButton(
              title: 'Settings', icon: Icons.settings, onPressed: () {}),
          Divider(thickness: 1, height: 5),
          getDrawerButton(
              title: 'Logout',
              icon: Icons.power_settings_new,
              onPressed: () {}),
          Divider(thickness: 1, height: 5),
          getDrawerButton(
              title: 'Help', icon: Icons.help_outline, onPressed: () {}),
        ],
      ),
    );
  }
}
