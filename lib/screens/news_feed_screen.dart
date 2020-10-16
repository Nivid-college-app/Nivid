import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Nivid/models/news_feed.dart';
import 'package:Nivid/widgets/news_feed_item.dart';
import 'package:Nivid/global/default_decorations.dart';

class NewsFeedScreen extends StatelessWidget {
  static const routeName = 'NewsFeedScreen';
  static Size size;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: PreferredSize(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: size.height * 0.05,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 5,
                                offset: Offset(0, 1))
                          ]),
                      child: TextFormField(
                          controller: searchController,
                          decoration: DefaultDecorations.roundedInputDecoration(
                              context,
                              controller: searchController,
                              icon: Icons.search,
                              suffix: Icon(Icons.clear),
                              title: 'Search')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TabBar(
                      indicator: BoxDecoration(),
                      labelColor: Colors.black,
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle: TextStyle(fontSize: 16),
                      tabs: [Text('College'), Text('Global')]),
                ),
              ],
            ),
            preferredSize: Size(size.width, size.height * 0.12),
          ),
          body: TabBarView(children: [
            getNewsTabItem(context),
            getNewsTabItem(context),
          ])),
    );
  }

  Widget getNewsTabItem(BuildContext context) {
    return ListView.builder(
        itemCount: newsfeeds.length + 1,
        itemBuilder: (context, index) {
          if (index == newsfeeds.length)
            return Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 90),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('No more feeds!\nThank you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            );
          return NewsFeedItem(feed: newsfeeds[index]);
        });
  }
}
