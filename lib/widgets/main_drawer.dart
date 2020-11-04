import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Nivid/services/authentication.dart';
import 'package:regexed_validator/regexed_validator.dart';

import 'package:Nivid/global/variables.dart';
import 'package:Nivid/services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Nivid/screens/about_us_screen.dart';
import 'package:Nivid/screens/academics_screen.dart';
import 'package:Nivid/global/default_dialog_box.dart';
import 'package:Nivid/helpers/custom_slide_route.dart';
import 'package:Nivid/screens/update_mess_menu_screen.dart';

class MainDrawer extends StatelessWidget {
  static Size size;
  static double top;

  Widget getDrawerButton(BuildContext context,
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
            Icon(
              icon,
              size: 26,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: top * 0.75),
            Text(title, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  showResetPasswordDialog(BuildContext context) async {
    final _formKey = GlobalKey<FormState>();
    final _passCtrl = TextEditingController();
    final _oldPassCtrl = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Reset password', style: TextStyle(fontSize: 20)),
                      Divider(
                          endIndent: size.width * 0.25,
                          thickness: 2,
                          color: Theme.of(context).primaryColor),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _oldPassCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Old password',
                            hintText: 'Enter old password'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _passCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'New password',
                            hintText: 'Enter new password'),
                        validator: (value) {
                          if (!validator.password(value) || value.length < 8)
                            return 'Must contain atleast 1 small, 1 capital,\n 1 numeric, and 1 special character';
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Align(
                        child: FloatingActionButton.extended(
                            foregroundColor: Colors.white,
                            backgroundColor: Theme.of(context).primaryColor,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                if (_oldPassCtrl.text == userData.password) {
                                  _formKey.currentState.save();
                                  await Authentication.resetPassword(context,
                                      _oldPassCtrl.text, _passCtrl.text);
                                  Navigator.pop(context);
                                }
                              }
                            },
                            label: Text('Reset',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16))),
                      )
                    ],
                  )),
            ));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    top = MediaQuery.of(context).padding.top;
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(left: size.width * 0.025, top: top),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 27,
              child: FutureBuilder(
                future: Database.getCollegePicture(userData.collegeId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircularProgressIndicator(),
                        ));
                  return CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      backgroundImage: snapshot.data == null
                          ? AssetImage('assets/images/college.jpg')
                          : NetworkImage(snapshot.data));
                },
              ),
            ),
            title: Text(userData.college,
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
            subtitle: Text('Hello ${userData.name}, welcome!',
                style: TextStyle(fontSize: 16)),
          ),
          Divider(thickness: 1, color: Colors.blueGrey),
          getDrawerButton(context,
              title: 'Academics',
              icon: FlutterIcons.school_mdi,
              onPressed: () => Navigator.of(context).push(
                  CustomSlideRoute(AcademicsScreen(), begin: Offset(1, 0)))),
          if (userData.isAdmin) Divider(thickness: 1, height: 5),
          if (userData.isAdmin)
            getDrawerButton(context,
                title: 'Update mess menu',
                icon: Icons.restaurant_menu,
                onPressed: () => Navigator.of(context).push(CustomSlideRoute(
                    UpdateMessMenuScreen(),
                    begin: Offset(1, 0)))),
          if (userData.isAdmin) Divider(thickness: 1, height: 5),
          if (userData.isAdmin)
            getDrawerButton(context,
                title: 'Reset password',
                icon: Icons.settings,
                onPressed: () async => await showResetPasswordDialog(context)),
          Divider(thickness: 1, height: 5),
          getDrawerButton(context,
              title: 'Logout',
              icon: Icons.power_settings_new,
              onPressed: () => DefaultDialogBox.errorDialog(context,
                  title: 'Are you sure!',
                  content: 'you want to logout?',
                  function: () => Authentication.logout(context))),
          Divider(thickness: 1, height: 5),
          getDrawerButton(context,
              title: 'About us',
              icon: Icons.person,
              onPressed: () => Navigator.of(context).push(
                  CustomSlideRoute(AboutUsScreen(), begin: Offset(1, 0)))),
          Divider(thickness: 1, height: 5),
          getDrawerButton(context,
              title: 'Help',
              icon: Icons.help_outline,
              onPressed: () =>
                  Fluttertoast.showToast(msg: 'Currently unavailable!')),
        ],
      ),
    );
  }
}
