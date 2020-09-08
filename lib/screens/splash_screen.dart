import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Nivid/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Size _size;
  bool _isFaded = false;
  bool _isFirst = true;
  Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _isFaded = !_isFaded;
      });
    });
    Future.delayed(Duration(seconds: 1), () {
      _isFirst = false;
    });
    Future.delayed(
        Duration(seconds: 5),
        () => Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false));
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer.isActive) _timer.cancel();
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height,
      width: _size.width,
      color: _isFirst ? Colors.white : Colors.black45,
      child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: _isFaded ? 0.25 : 1.0,
          curve: Curves.linear,
          child:
              Image.asset('assets/images/splash_icon.png', fit: BoxFit.fill)),
    );
  }
}
