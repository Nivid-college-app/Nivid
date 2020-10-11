import 'package:flutter/cupertino.dart';

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

  toJson() => {
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
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text:
          'Welcome to Nivid\nAn app to connect students accross all colleges around the world.',
      description: 'A song for entertainment.\n😍\nEnjoy!',
      timePosted: DateTime(2020, 9, 15)),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink:
          'https://firebasestorage.googleapis.com/v0/b/nivid-5721c.appspot.com/o/tempVideos%2FUFF%20Full%20Video%20-%20BANG%20BANG!%20-%20Hrithik%20Roshan%20%26%20Katrina%20Kaif%20-%20HD.mp4?alt=media&token=fac2f9f8-3e72-46da-a8eb-05c098f7e089',
      imagelinks: null,
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'A song for entertainment.\n😍\nEnjoy!',
      timePosted: DateTime(2020, 9, 15)),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam photography',
      userImageLink: null,
      isVideo: false,
      isText: false,
      videoLink: null,
      imagelinks: [
        'https://firebasestorage.googleapis.com/v0/b/nivid-5721c.appspot.com/o/tempVideos%2F26447186.jpg?alt=media&token=bf0f41c8-60c5-4e9f-9b1a-1daaadc3454e',
        'https://firebasestorage.googleapis.com/v0/b/nivid-5721c.appspot.com/o/tempVideos%2FAutumn-Update-2012-pic1.jpg?alt=media&token=e53f461a-23f5-4cee-81db-a4e865923a82'
      ],
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'Some cool nature photos.\n😍\nEnjoy!',
      timePosted: DateTime(2020, 9, 15)),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam photography',
      userImageLink: null,
      isVideo: false,
      isText: false,
      videoLink: null,
      imagelinks: [
        'https://firebasestorage.googleapis.com/v0/b/nivid-5721c.appspot.com/o/tempVideos%2Fathirapally-waterfalls-kerala.jpg?alt=media&token=a526c255-756a-4f0d-8da0-57f24ae18761',
        'https://firebasestorage.googleapis.com/v0/b/nivid-5721c.appspot.com/o/tempVideos%2Fmunnar-hill-station-kerala.jpg?alt=media&token=b2bf8ea9-2476-429c-9fb8-2ff3c135d476',
        'https://firebasestorage.googleapis.com/v0/b/nivid-5721c.appspot.com/o/tempVideos%2Fpexels-photo-257360.jpeg?alt=media&token=38823ada-10c4-4dde-a546-26c6eefc3baf',
        'https://firebasestorage.googleapis.com/v0/b/nivid-5721c.appspot.com/o/tempVideos%2Fpexels-photo-356977.jpeg?alt=media&token=b87eb0ac-3e6c-4e9f-aed8-d07b67e0abfd'
      ],
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'Some cool nature photos.\n😍\nEnjoy!',
      timePosted: DateTime(2020, 9, 15))
];
