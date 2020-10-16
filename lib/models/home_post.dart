import 'package:Nivid/global/variables.dart';
import 'package:flutter/foundation.dart';

class HomePost {
  String id;
  String uid;
  String userName;
  String userImageLink;
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
      @required this.userImageLink,
      @required this.isVideo,
      @required this.isText,
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
    this.userImageLink = doc['uil'];
    this.isVideo = doc['isVid'];
    this.isText = doc['isTxt'];
    this.videoLink = doc['vidLnk'];
    this.imagelinks = doc['imgLnks'];
    this.userIdsLiked = doc['uidLks'];
    this.userIdsDisliked = doc['uidDlks'];
    this.text = doc['text'];
    this.description = doc['desc'];
    this.timePosted = doc['tp']?.toDate();
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'uid': this.uid,
        'usrNm': this.userName,
        'uil': this.userImageLink,
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

List<HomePost> posts = [
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: false,
      isText: true,
      videoLink: null,
      imagelinks: null,
      userIdsLiked: ['1', '2', '5', '6' '7', '8', '9'],
      userIdsDisliked: ['3', '4'],
      text:
          'Welcome to Nivid\nAn app to connect students accross all colleges around the world.',
      description:
          'I hope you like this new app! This app helps you a lot in your daily college life. Share app, support us, Thank you, Have a nice day.',
      timePosted: DateTime.now()),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink: dummyVideoLinks.first,
      imagelinks: null,
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description:
          'A song for entertainment.\n😍I hope you enjoy it, Have a good day\nAll is well!',
      timePosted: DateTime.now().subtract(Duration(minutes: 1))),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink: dummyVideoLinks.elementAt(1),
      imagelinks: null,
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description:
          'A song for entertainment.\n😍I hope you enjoy it, Have a good day\nAll is well!',
      timePosted: DateTime.now().subtract(Duration(minutes: 30))),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink: dummyVideoLinks.elementAt(2),
      imagelinks: null,
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'A song for entertainment.\n😍\nEnjoy!',
      timePosted: DateTime.now().subtract(Duration(minutes: 30, hours: 1))),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink: dummyVideoLinks.elementAt(3),
      imagelinks: null,
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'A song for entertainment.\n😍\nEnjoy!',
      timePosted: DateTime.now().subtract(Duration(days: 1, hours: 3))),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam photography',
      userImageLink: null,
      isVideo: false,
      isText: false,
      videoLink: null,
      imagelinks: dummyImageLinks.getRange(0, 2).toList(),
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'Some cool nature photos.\n😍\nEnjoy!',
      timePosted: DateTime.now().subtract(Duration(days: 3))),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam photography',
      userImageLink: null,
      isVideo: false,
      isText: false,
      videoLink: null,
      imagelinks: dummyImageLinks.getRange(3, 7).toList(),
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'Some cool nature photos.\n😍\nEnjoy!',
      timePosted: DateTime.now().subtract(Duration(days: 7, hours: 1))),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink: dummyVideoLinks.elementAt(4),
      imagelinks: null,
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'A song for entertainment.\n😍\nEnjoy!',
      timePosted: DateTime.now().subtract(Duration(days: 21))),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam photography',
      userImageLink: null,
      isVideo: false,
      isText: false,
      videoLink: null,
      imagelinks: dummyImageLinks.getRange(0, 2).toList(),
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'Some cool nature photos.\n😍\nEnjoy!',
      timePosted: DateTime.now().subtract(Duration(days: 32))),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam photography',
      userImageLink: null,
      isVideo: false,
      isText: false,
      videoLink: null,
      imagelinks: dummyImageLinks.getRange(3, 7).toList(),
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'Some cool nature photos.\n😍\nEnjoy!',
      timePosted: DateTime.now().subtract(Duration(days: 30))),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink: dummyVideoLinks.last,
      imagelinks: null,
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'A song for entertainment.\n😍\nEnjoy!',
      timePosted: DateTime.now().subtract(Duration(days: 60))),
];
