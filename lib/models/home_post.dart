import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class HomePost {
  String id;
  String uid;
  String userName;
  bool isVideo;
  bool isText;
  String videoLink;
  List<String> imagelinks;
  List<String> userIdsLiked;
  List<String> userIdsDisliked;
  String text;
  String description;
  DateTime timePosted;

  HomePost(
      {@required this.id,
      @required this.uid,
      @required this.userName,
      this.isVideo = false,
      this.isText = false,
      @required this.videoLink,
      @required this.imagelinks,
      @required this.userIdsLiked,
      @required this.userIdsDisliked,
      @required this.text,
      @required this.description,
      @required this.timePosted});

  HomePost.fromMap(Map<String, dynamic> doc) {
    this.id = doc['id'];
    this.uid = doc['uid'];
    this.userName = doc['usrNm'];
    this.isVideo = doc['isVid'];
    this.isText = doc['isTxt'];
    this.videoLink = doc['vidLnk'];
    this.imagelinks = [...doc['imgLnks']];
    this.userIdsLiked = [...doc['uidLks']];
    this.userIdsDisliked = [...doc['uidDlks']];
    this.text = doc['text'];
    this.description = doc['desc'];
    this.timePosted = doc['tp']?.toDate();
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'uid': this.uid,
        'usrNm': this.userName,
        'isVid': this.isVideo,
        'isTxt': this.isText,
        'vidLnk': this.videoLink,
        'imgLnks': this.imagelinks,
        'uidLks': this.userIdsLiked,
        'uidDlks': this.userIdsDisliked,
        'text': this.text,
        'desc': this.description,
        'tp': this.timePosted,
      };
}

Future<List<HomePost>> getAllPosts() async {
  final snap = await FirebaseFirestore.instance
      .collection('posts')
      .orderBy('tp', descending: true)
      .get();
  return snap.docs.map((e) => HomePost.fromMap(e.data())).toList();
}
