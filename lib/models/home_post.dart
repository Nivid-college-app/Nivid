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
      userIdsLiked: ['1', '2', '5', '6' '7', '8', '9'],
      userIdsDisliked: ['3', '4'],
      text:
          'Welcome to Nivid\nAn app to connect students accross all colleges around the world.',
      description:
          'I hope you like this new app! This app helps you a lot in your daily college life. Share app, support us, Thank you, Have a nice day.',
      timePosted: DateTime(2020, 9, 15)),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink:
          'https://player.vimeo.com/external/374176493.sd.mp4?s=c13d56141ab075639f96da8f3800b32b5f51bef6&profile_id=139&oauth2_token_id=57447761',
      imagelinks: null,
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description:
          'A song for entertainment.\n😍I hope you enjoy it, Have a good day\nAll is well!',
      timePosted: DateTime(2020, 9, 15)),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink:
          'https://player.vimeo.com/external/363012285.sd.mp4?s=f9f1082e164fa9ce78dba9beb858cae8afaa108c&profile_id=139&oauth2_token_id=57447761',
      imagelinks: null,
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description:
          'A song for entertainment.\n😍I hope you enjoy it, Have a good day\nAll is well!',
      timePosted: DateTime(2020, 9, 15)),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink:
          'https://player.vimeo.com/external/459124841.sd.mp4?s=367e9855780d54c05c257587aae710b7028add35&profile_id=165&oauth2_token_id=57447761',
      imagelinks: null,
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
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
          'https://player.vimeo.com/external/363013785.sd.mp4?s=1d1a3b39ad78af16c346cbff77895dd0f28ddc67&profile_id=139&oauth2_token_id=57447761',
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
        'https://cdn.mos.cms.futurecdn.net/gvQ9NhQP8wbbM32jXy4V3j.jpg',
        'https://sarahfunky.com/wp-content/uploads/bb-plugin/cache/image-asset-panorama.jpeg',
        'https://www.wallpapers13.com/wp-content/uploads/2016/05/Cameroon-West-Africa-green-landscape-red-sky-sunset-Desktop-Wallpaper-full-screen-1680x1050.jpg '
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
        'https://www.digitalphotomentor.com/photography/2014/04/sunset-white-balance-06.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTYlxt-NGCMQ5yL8wVnn9FVcjOL1xGC6wUhxA&usqp=CAU',
        'https://images.unsplash.com/photo-1503949042290-cdd68d518962?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'https://us.123rf.com/450wm/grigory_bruev/grigory_bruev1509/grigory_bruev150900154/45289404-sky-bright-blue-orange-and-yellow-colors-sunset-instant-photo-toned-image-gradient-background.jpg?ver=6'
      ],
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'Some cool nature photos.\n😍\nEnjoy!',
      timePosted: DateTime(2020, 9, 15)),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink:
          'https://player.vimeo.com/external/297927806.sd.mp4?s=0f0a0de1d75bff9f84fa992d7a5253dedc4f35d6&profile_id=164&oauth2_token_id=57447761',
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
        'https://cdn.mos.cms.futurecdn.net/gvQ9NhQP8wbbM32jXy4V3j.jpg',
        'https://sarahfunky.com/wp-content/uploads/bb-plugin/cache/image-asset-panorama.jpeg',
        'https://www.wallpapers13.com/wp-content/uploads/2016/05/Cameroon-West-Africa-green-landscape-red-sky-sunset-Desktop-Wallpaper-full-screen-1680x1050.jpg '
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
        'https://www.digitalphotomentor.com/photography/2014/04/sunset-white-balance-06.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTYlxt-NGCMQ5yL8wVnn9FVcjOL1xGC6wUhxA&usqp=CAU',
        'https://images.unsplash.com/photo-1503949042290-cdd68d518962?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'https://us.123rf.com/450wm/grigory_bruev/grigory_bruev1509/grigory_bruev150900154/45289404-sky-bright-blue-orange-and-yellow-colors-sunset-instant-photo-toned-image-gradient-background.jpg?ver=6'
      ],
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'Some cool nature photos.\n😍\nEnjoy!',
      timePosted: DateTime(2020, 9, 15)),
  HomePost(
      id: '1',
      uid: '1',
      userName: 'IIIT Kottayam admin',
      userImageLink: null,
      isVideo: true,
      isText: false,
      videoLink:
          'https://player.vimeo.com/external/314714772.sd.mp4?s=b3d92ace8cc000fb98770b2e59ade626f98ce642&profile_id=164&oauth2_token_id=57447761',
      imagelinks: null,
      userIdsLiked: ['1', '2', '7'],
      userIdsDisliked: ['3', '4', '5', '6'],
      text: null,
      description: 'A song for entertainment.\n😍\nEnjoy!',
      timePosted: DateTime(2020, 9, 15)),
];
