import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:Nivid/screens/home_screen.dart';
import 'package:Nivid/screens/login_screen.dart';
import 'package:Nivid/screens/signup_screen.dart';
import 'package:Nivid/screens/decider_screen.dart';
import 'package:Nivid/global/variables.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Firebase.initializeApp().then((value) {
    firebaseApp = value;
    firebaseuser = FirebaseAuth.instance.currentUser;
    Future.delayed(Duration(seconds: 2), () {
      SystemChrome.setEnabledSystemUIOverlays(
          [SystemUiOverlay.top, SystemUiOverlay.bottom]);
      runApp(MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nivid',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(122, 0, 204, 1),
        // accentColor: Color.fromRGBO(204, 102, 255, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      // initialRoute: _firebaseuser == null ? DeciderScreen.routeName : null,
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        DeciderScreen.routeName: (ctx) => DeciderScreen(),
      },
    );
  }
}
