import 'dart:ui';
import 'package:Nivid/helpers/custom_fade_route.dart';
import 'package:Nivid/helpers/custome_scale_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:Nivid/screens/home_screen.dart';
import 'package:Nivid/global/default_buttons.dart';
import 'package:Nivid/global/default_decorations.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = 'SignupScreen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Size size;
  double top;
  bool _glowName = false;
  bool _glowEmail = false;
  bool _glowPassword = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('New college',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: size.width * 0.325,
                              child: Divider(
                                  color: Theme.of(context).primaryColor,
                                  thickness: 2),
                            ),
                            SizedBox(height: top),
                          ],
                        ),
                        FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: CircleBorder(
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            child: Icon(FlutterIcons.add_a_photo_mdi,
                                color: Colors.black))
                      ],
                    ),
                    Text('\tEmail',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _glowEmail
                                ? Theme.of(context).primaryColor
                                : Colors.black)),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _glowName = false;
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
                    Text('\tCollege Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _glowName
                                ? Theme.of(context).primaryColor
                                : Colors.black)),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _glowName = true;
                          _glowEmail = false;
                          _glowPassword = false;
                        });
                      },
                      controller: _nameController,
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black, letterSpacing: 1),
                      keyboardType: TextInputType.name,
                      decoration: DefaultDecorations.defaultInputDecoration(
                          context,
                          icon: FlutterIcons.university_faw5s),
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
                          _glowName = false;
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
                    SizedBox(height: top),
                    Align(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: DefaultButtons.floatButton(context,
                            onTap: () => Navigator.of(context)
                                .pushAndRemoveUntil(
                                    CustomScaleRoute(HomeScreen()),
                                    (route) => false),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            title: 'Sign up',
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
