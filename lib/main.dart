import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:Nivid/global/variables.dart';
import 'package:Nivid/services/database.dart';
import 'package:Nivid/screens/mess_screen.dart';
import 'package:Nivid/screens/login_screen.dart';
import 'package:Nivid/screens/signup_screen.dart';
import 'package:Nivid/screens/decider_screen.dart';
import 'package:Nivid/screens/gallery_screen.dart';
import 'package:Nivid/screens/about_us_screen.dart';
import 'package:Nivid/screens/add_news_screen.dart';
import 'package:Nivid/screens/add_post_screen.dart';
import 'package:Nivid/screens/academics_screen.dart';
import 'package:Nivid/screens/home_feed_screen.dart';
import 'package:Nivid/screens/news_feed_screen.dart';
import 'package:Nivid/screens/time_table_screen.dart';
import 'package:Nivid/screens/bottom_tabs_screen.dart';
import 'package:Nivid/screens/update_mess_menu_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  firebaseApp = await Firebase.initializeApp();
  firebaseuser = FirebaseAuth.instance.currentUser;
  try {
    await Database.getUserData();
  } catch (_) {}
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
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
              centerTitle: true,
              textTheme: TextTheme(
                  headline6:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 20)))),
      home: BottomTabsScreen(),
      initialRoute: firebaseuser == null || userData == null
          ? DeciderScreen.routeName
          : null,
      routes: {
        DeciderScreen.routeName: (ctx) => DeciderScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        HomeFeedScreen.routeName: (ctx) => HomeFeedScreen(),
        NewsFeedScreen.routeName: (ctx) => NewsFeedScreen(),
        MessScreen.routeName: (ctx) => MessScreen(),
        GalleryScreen.routeName: (ctx) => GalleryScreen(),
        BottomTabsScreen.routeName: (ctx) => BottomTabsScreen(),
        AddPostScreen.routeName: (ctx) => AddPostScreen(),
        AddNewsScreen.routeName: (ctx) => AddNewsScreen(),
        AcademicsScreen.routeName: (ctx) => AcademicsScreen(),
        TimeTableScreen.routeName: (ctx) => TimeTableScreen(),
        UpdateMessMenuScreen.routeName: (ctx) => UpdateMessMenuScreen(),
        AboutUsScreen.routeName: (ctx) => AboutUsScreen(),
      },
    );
  }
}
