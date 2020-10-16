import 'dart:ui';
import 'package:Nivid/helpers/custome_scale_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:Nivid/global/default_buttons.dart';
import 'package:Nivid/global/default_decorations.dart';
import 'package:Nivid/screens/bottom_tabs_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size size;
  double top;
  bool _glowPassword = false;
  bool _glowEmail = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.bottomCenter,
        child: FittedBox(
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 40, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Welcome back',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold)),
                    ),
                    Divider(
                        color: Theme.of(context).primaryColor,
                        thickness: 2,
                        endIndent: size.width * 0.465),
                    SizedBox(height: top),
                    Text('\tEmail',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _glowEmail
                                ? Theme.of(context).primaryColor
                                : Colors.black)),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _glowEmail = true;
                          _glowPassword = false;
                        });
                      },
                      controller: _emailController,
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black, letterSpacing: 1),
                      keyboardType: TextInputType.emailAddress,
                      decoration: DefaultDecorations.defaultInputDecoration(
                          context,
                          icon: Icons.email),
                    ),
                    SizedBox(height: top),
                    Text('\tPassword',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _glowPassword
                                ? Theme.of(context).primaryColor
                                : Colors.black)),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _glowEmail = false;
                          _glowPassword = true;
                        });
                      },
                      controller: _passwordController,
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black, letterSpacing: 1),
                      obscureText: true,
                      decoration: DefaultDecorations.defaultInputDecoration(
                          context,
                          icon: FlutterIcons.key_oct),
                    ),
                    SizedBox(height: top * 0.5),
                    Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            onPressed: () {},
                            child: Text('Forgot password?',
                                style: TextStyle(fontSize: 15)))),
                    Align(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: DefaultButtons.floatButton(context,
                            onTap: () => Navigator.of(context)
                                .pushAndRemoveUntil(
                                    CustomScaleRoute(BottomTabsScreen()),
                                    (route) => false),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            title: 'Sign in',
                            width: 70,
                            height: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
