import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:Nivid/services/authentication.dart';

class MainDrawer extends StatelessWidget {
  static Size size;
  static double top;
  static BuildContext ctx;

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
            Icon(icon, size: 26),
            SizedBox(width: top),
            Text(title, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    top = MediaQuery.of(context).padding.top;
    ctx = context;
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(left: size.width * 0.025, top: top),
            leading: CircleAvatar(
                radius: size.width * 0.075,
                backgroundImage: AssetImage('assets/images/iiitk.jpg')),
            title: Text('IIIT Kottayam',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(ctx).primaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
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
              title: 'Settings', icon: Icons.settings, onPressed: () {}),
          Divider(thickness: 1, height: 5),
          getDrawerButton(
              title: 'Logout',
              icon: Icons.power_settings_new,
              onPressed: () => Authentication.logout(context)),
          Divider(thickness: 1, height: 5),
          getDrawerButton(
              title: 'About us', icon: Icons.person, onPressed: () {}),
          Divider(thickness: 1, height: 5),
          getDrawerButton(
              title: 'Help', icon: Icons.help_outline, onPressed: () {}),
        ],
      ),
    );
  }
}
