import 'package:flutter/material.dart';
import 'package:Nivid/global/methods.dart';
import 'package:Nivid/models/news_feed.dart';

class NewsFeedItem extends StatelessWidget {
  final NewsFeed feed;
  const NewsFeedItem({this.feed});
  static Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final _time = convertDateToReadableString(feed.timePosted);
    return Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3, offset: Offset(0, 1), color: Colors.black45)
            ]),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
                height: size.width * 0.2,
                width: size.width * 0.2,
                fit: BoxFit.fill,
                placeholder: AssetImage('assets/images/app_icon.png'),
                image: NetworkImage(feed.imageLink)),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(feed.headLine,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(toValueString(feed.type),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor)),
                          Text(_time,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]))
                        ]),
                  )
                ]),
          ))
        ]));
  }
}
