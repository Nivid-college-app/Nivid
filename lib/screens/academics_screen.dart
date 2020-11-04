import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:Nivid/global/variables.dart';
import 'package:Nivid/services/database.dart';
import 'package:Nivid/helpers/custom_fade_route.dart';
import 'package:Nivid/screens/time_table_screen.dart';

class AcademicsScreen extends StatelessWidget {
  static const routeName = '\AcademicsScreen';
  static Size size;

  Widget getGridContainer(String title, String image, Function onPresses) {
    return InkWell(
      onTap: onPresses,
      child: Container(
          width: size.width * 0.5 - 40,
          height: size.width * 0.5 - 40,
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(0)),
          child: FittedBox(
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold)),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text('Academics')),
        body: Column(
          children: [
            SizedBox(
                height: size.height * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 27,
                        child: FutureBuilder(
                          future:
                              Database.getCollegePicture(userData.collegeId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting)
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
                        )),
                    SizedBox(width: 10),
                    Text(userData.college,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand')),
                  ],
                )),
            Column(
              children: [
                Row(children: [
                  getGridContainer(
                      'Time table',
                      'assets/images/timetable.jpg',
                      () => Navigator.of(context)
                          .push(CustomFadeRoute(TimeTableScreen()))),
                  getGridContainer('Documents', 'assets/images/documents.jpg',
                      () {
                    Fluttertoast.showToast(msg: 'Currently unavailable!');
                  }),
                ]),
                SizedBox(height: 50),
                Row(children: [
                  getGridContainer(
                      'Leave application', 'assets/images/application.jpg', () {
                    Fluttertoast.showToast(msg: 'Currently unavailable!');
                  }),
                  getGridContainer('Others', 'assets/images/others.jpg', () {
                    Fluttertoast.showToast(msg: 'Currently unavailable!');
                  })
                ])
              ],
            ),
          ],
        ));
  }
}
