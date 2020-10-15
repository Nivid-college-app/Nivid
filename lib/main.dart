import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:Nivid/global/variables.dart';
import 'package:Nivid/screens/mess_screen.dart';
import 'package:Nivid/screens/home_screen.dart';
import 'package:Nivid/screens/login_screen.dart';
import 'package:Nivid/screens/signup_screen.dart';
import 'package:Nivid/screens/decider_screen.dart';
import 'package:Nivid/screens/gallery_screen.dart';
import 'package:Nivid/screens/home_feed_screen.dart';
import 'package:Nivid/screens/news_feed_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  firebaseApp = await Firebase.initializeApp();
  firebaseuser = FirebaseAuth.instance.currentUser;
  await Future.delayed(Duration(seconds: 2), () {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nivid',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(122, 0, 204, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DeciderScreen(),
      // home: HomeScreen(),
      // initialRoute: HomeScreen.routeName,
      // initialRoute: firebaseuser == null ? DeciderScreen.routeName : null,
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        DeciderScreen.routeName: (ctx) => DeciderScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        HomeFeedScreen.routeName: (ctx) => HomeFeedScreen(),
        NewsFeedScreen.routeName: (ctx) => NewsFeedScreen(),
        MessScreen.routeName: (ctx) => MessScreen(),
        GalleryScreen.routeName: (ctx) => GalleryScreen(),
      },
    );
  }
}
