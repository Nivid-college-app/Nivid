import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum NewsType {
  General,
  Technical,
  Social,
  Science,
  Sports,
  Entertainment,
}

String toValueString(NewsType type) {
  switch (type) {
    case NewsType.General:
      return 'GENERAL';
    case NewsType.Technical:
      return 'TECHNICAL';
    case NewsType.Social:
      return 'SOCIAL';
    case NewsType.Science:
      return 'SCIENCE';
    case NewsType.Sports:
      return 'SPORTS';
    case NewsType.Entertainment:
      return 'ENTERTAINMENT';
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
    case 'SCIENCE':
      return NewsType.Science;
    case 'SPORTS':
      return NewsType.Sports;
    case 'ENTERTAINMENT':
      return NewsType.Entertainment;
    default:
      return null;
  }
}

class NewsFeed {
  String id;
  String uid;
  String userName;
  String downloadLink;
  String headLine;
  String description;
  bool isVideo;
  bool isGlobal;
  NewsType type;
  DateTime timePosted;

  NewsFeed({
    @required this.id,
    @required this.uid,
    @required this.userName,
    @required this.downloadLink,
    this.isVideo = false,
    this.isGlobal = false,
    @required this.headLine,
    @required this.description,
    @required this.type,
    @required this.timePosted,
  });

  NewsFeed.fromMap(Map<String, dynamic> doc) {
    this.id = doc['id'];
    this.uid = doc['uid'];
    this.userName = doc['usrnm'];
    this.downloadLink = doc['dllnk'];
    this.isVideo = doc['isVid'];
    this.isGlobal = doc['isGbl'];
    this.headLine = doc['hdln'];
    this.description = doc['desc'];
    this.type = toEnum(doc['type']);
    this.timePosted = doc['tp']?.toDate();
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'uid': this.uid,
        'usrnm': this.userName,
        'dllnk': this.downloadLink,
        'isVid': this.isVideo,
        'isGbl': this.isGlobal,
        'hdln': this.headLine,
        'desc': this.description,
        'type': toValueString(this.type),
        'tp': this.timePosted,
      };
}

Future<List<NewsFeed>> getAllNewsfeeds({bool isCollege = false}) async {
  final snap = await FirebaseFirestore.instance
      .collection('newsfeeds')
      .orderBy('tp', descending: true)
      .get();
  if (isCollege) {
    return snap.docs.map((e) {
      if (!e.data()['isGbl']) {
        return NewsFeed.fromMap(e.data());
      }
    }).toList();
  }
  return snap.docs.map((e) {
    if (e.data()['isGbl']) {
      return NewsFeed.fromMap(e.data());
    }
  }).toList();
}
