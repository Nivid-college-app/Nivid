import 'package:Nivid/global/variables.dart';
import 'package:flutter/foundation.dart';

enum NewsType {
  General,
  Technical,
  Social,
}

String toValueString(NewsType type) {
  switch (type) {
    case NewsType.General:
      return 'GENERAL';
    case NewsType.Technical:
      return 'TECHNICAL';
    case NewsType.Social:
      return 'SOCIAL';
    default:
      return null;
  }
}

NewsType toEnum(String type) {
  switch (type) {
    case 'GENERAL':
      return NewsType.General;
    case 'TECHNICAL':
      return NewsType.Technical;
    case 'SOCIAL':
      return NewsType.Social;
    default:
      return null;
  }
}

class NewsFeed {
  String id;
  String uid;
  String imageLink;
  String headLine;
  String description;
  NewsType type;
  DateTime timePosted;

  NewsFeed({
    @required this.id,
    @required this.uid,
    @required this.imageLink,
    @required this.headLine,
    @required this.description,
    @required this.type,
    @required this.timePosted,
  });

  NewsFeed.fromMap(Map<String, dynamic> doc) {
    this.id = doc['id'];
    this.uid = doc['uid'];
    this.imageLink = doc['imglnk'];
    this.headLine = doc['hdln'];
    this.description = doc['desc'];
    this.type = toEnum(doc['type']);
    this.timePosted = doc['tp']?.toDate();
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'uid': this.uid,
        'imglnk': this.imageLink,
        'hdln': this.headLine,
        'desc': this.description,
        'type': toValueString(this.type),
        'tp': this.timePosted,
      };
}

List<NewsFeed> newsfeeds = [
  NewsFeed(
      id: '1',
      uid: '1',
      imageLink: dummyImageLinks.first,
      headLine: 'Apple Paid \$300,000 to \'hackers\', here\s why?',
      description: 'ipsum loream default display text',
      type: NewsType.General,
      timePosted: DateTime.now()),
  NewsFeed(
      id: '2',
      uid: '1',
      imageLink: dummyImageLinks.elementAt(1),
      headLine: 'Apple Paid \$300,000 to \'hackers\', here\s why?',
      description: 'ipsum loream default display text',
      type: NewsType.Social,
      timePosted: DateTime.now().subtract(Duration(minutes: 1))),
  NewsFeed(
      id: '3',
      uid: '1',
      imageLink: dummyImageLinks.elementAt(2),
      headLine: 'Apple Paid \$300,000 to \'hackers\', here\s why?',
      description: 'ipsum loream default display text',
      type: NewsType.Technical,
      timePosted: DateTime.now().subtract(Duration(minutes: 30))),
  NewsFeed(
      id: '4',
      uid: '1',
      imageLink: dummyImageLinks.elementAt(3),
      headLine: 'Apple Paid \$300,000 to \'hackers\', here\s why?',
      description: 'ipsum loream default display text',
      type: NewsType.General,
      timePosted: DateTime.now().subtract(Duration(hours: 3))),
  NewsFeed(
      id: '5',
      uid: '1',
      imageLink: dummyImageLinks.elementAt(4),
      headLine: 'Apple Paid \$300,000 to \'hackers\', here\s why?',
      description: 'ipsum loream default display text',
      type: NewsType.Technical,
      timePosted: DateTime.now().subtract(Duration(hours: 3, days: 1))),
  NewsFeed(
      id: '6',
      uid: '1',
      imageLink: dummyImageLinks.elementAt(5),
      headLine: 'Apple Paid \$300,000 to \'hackers\', here\s why?',
      description: 'ipsum loream default display text',
      type: NewsType.Social,
      timePosted: DateTime.now().subtract(Duration(days: 3))),
  NewsFeed(
      id: '7',
      uid: '1',
      imageLink: dummyImageLinks.elementAt(6),
      headLine: 'Apple Paid \$300,000 to \'hackers\', here\s why?',
      description: 'ipsum loream default display text',
      type: NewsType.General,
      timePosted: DateTime.now().subtract(Duration(days: 7, hours: 1))),
  NewsFeed(
      id: '8',
      uid: '1',
      imageLink: dummyImageLinks.last,
      headLine: 'Apple Paid \$300,000 to \'hackers\', here\s why?',
      description: 'ipsum loream default display text',
      type: NewsType.Social,
      timePosted: DateTime.now().subtract(Duration(days: 30))),
];
