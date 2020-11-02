import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:Nivid/screens/login_screen.dart';
// import 'package:Nivid/screens/signup_screen.dart';
import 'package:Nivid/global/default_buttons.dart';
import 'package:Nivid/services/authentication.dart';
import 'package:Nivid/helpers/custom_slide_route.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeciderScreen extends StatelessWidget {
  static const routeName = '\DeciderScreen';
  static Size _size;
  static double _top;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _top = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: _size.width,
        height: _size.height,
        decoration: BoxDecoration(
            color: Colors.black12,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/login_background_alt.jpg'))),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.black26,
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: _size.width * 0.75,
                        height: _size.height * 0.45,
                        child: Image.asset('assets/images/app_name.png')),
                    FittedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            width: _size.width * 0.35,
                            child: Divider(
                                indent: _size.width * 0.1,
                                endIndent: _size.width * 0.025,
                                thickness: 1,
                                color: Colors.white),
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'Administrator',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white))),
                          SizedBox(
                            width: _size.width * 0.35,
                            child: Divider(
                                indent: _size.width * 0.025,
                                endIndent: _size.width * 0.1,
                                thickness: 1,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: _top),
                    DefaultButtons.floatButton(context,
                        onTap: () => Navigator.of(context)
                            .push(CustomSlideRoute(LoginScreen())),
                        title: 'Sign in',
                        width: 55,
                        height: 10),
                    SizedBox(height: _top),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(199, 211, 212, 1)))),
                    SizedBox(height: _top * 0.5),
                    DefaultButtons.floatButton(context,
                        onTap: () => Fluttertoast.showToast(
                            msg: 'Currently not available'),
                        // onTap: () => Navigator.of(context)
                        //     .push(CustomSlideRoute(SignupScreen())),
                        width: 50,
                        height: 10,
                        title: 'Sign up'),
                    SizedBox(height: _top * 1.5),
                    FittedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            width: _size.width * 0.4,
                            child: Divider(
                                indent: _size.width * 0.1,
                                endIndent: _size.width * 0.025,
                                thickness: 1,
                                color: Colors.white),
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Student?\n',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                    TextSpan(text: 'Sign in with')
                                  ],
                                  text: 'OR\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          SizedBox(
                            width: _size.width * 0.4,
                            child: Divider(
                                indent: _size.width * 0.025,
                                endIndent: _size.width * 0.1,
                                thickness: 1,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: _top),
                    DefaultButtons.floatButton(context,
                        onTap: () => Authentication.googleSignin(context),
                        title: 'Sign in',
                        width: 15,
                        height: 10,
                        leading: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/images/google.png'),
                        )),
                    SizedBox(height: _top),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
