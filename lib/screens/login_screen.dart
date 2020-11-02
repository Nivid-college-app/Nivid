import 'dart:ui';
import 'package:Nivid/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:Nivid/global/default_buttons.dart';
import 'package:Nivid/global/default_decorations.dart';
import 'package:regexed_validator/regexed_validator.dart' as regex;

class LoginScreen extends StatefulWidget {
  static const routeName = '\LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size size;
  double top;
  bool _glowPassword = false;
  bool _glowEmail = false;
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

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
        child: Column(
          children: [
            Expanded(
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      color: Colors.transparent,
                      width: size.width,
                    ))),
            Dismissible(
              key: ValueKey('login'),
              direction: DismissDirection.down,
              onDismissed: (direction) {
                Navigator.pop(context);
              },
              child: FittedBox(
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50))),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 40, bottom: 20),
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
                          controller: _emailCtrl,
                          validator: (value) {
                            if (regex.validator.email(value))
                              return null;
                            else
                              return 'Invalid email!';
                          },
                          cursorColor: Colors.black,
                          style:
                              TextStyle(color: Colors.black, letterSpacing: 1),
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
                          controller: _passwordCtrl,
                          cursorColor: Colors.black,
                          style:
                              TextStyle(color: Colors.black, letterSpacing: 1),
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
                                onTap: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                Authentication.signin(context,
                                    email: _emailCtrl.text,
                                    password: _passwordCtrl.text);
                              }
                            },
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
          ],
        ),
      ),
    );
  }
}
