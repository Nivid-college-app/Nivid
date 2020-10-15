import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  static const routeName = 'NewsFeedScreen';
  static Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: TabBarView(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Scrollbar(
                    child: ListView.builder(
                        itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                            ))),
              ],
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Scrollbar(
                    child: ListView.builder(
                        itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                            ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
